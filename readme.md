# SGML

Safe Game Maker Language.

## Contents

- [SGML](#sgml)
  - [Contents](#contents)
  - [About](#about)
  - [Roadmap](#roadmap)
  - [Install](#install)
  - [Setup](#setup)
    - [Installing](#installing)
    - [Building](#building)
    - [Testing](#testing)
  - [Running](#running)

## About

GML is a very dynamic scripting language with a relaxed type system. The compiler which Game Maker Studio uses does little to prevent the kinds of errors which modern compilers are capable of detecting at compile time.

As such, the goal of SGML is to provide a tool for GML developers to fill the gap between the GMS compiler and the expectations of a modern compiler.

The primary focus of SGML is not to provide a compiler which transforms GML into some other form, but rather a tool which can be used to perform static analysis of GML code. SGML aims to perform the following types of analysis

+ Type checking
+ Data flow analysis
+ Control flow analysis

## Roadmap

+ [x] Lexical analysis
  + [x] Lexer implementation
  + [x] Test cases
+ [x] Syntax analysis
  + [x] AST implementations
  + [x] Parser implementation
  + [ ] Test cases
+ [ ] Semantic analysis
  + [ ] Symbol implementations
  + [ ] Visitor/pass pattern implementation
  + [ ] Support built in functions and variables
  + [ ] Find references to undefined symbols
  + [ ] Find symbols with no references (dead code)
  + [ ] Find shadowed or redeclared symbols
  + [ ] Test cases
+ [ ] Type checking
  + [ ] Bound AST implementations
  + [ ] Binder implementation
  + [ ] Test cases

## Install

Currently, the only way to install the SGML tool is by cloning the source and following the setup steps. When SGML is in a more useful state, the tool will be published on npm.

## Setup

### Installing

Clone this repository

```bash
$ git clone https://github.com/thomas-crane/sgml.git
$ cd sgml

```

Install the dependencies

```bash
$ npm install

```

### Building

Whenever changes are made to the source code, the build command must be run in order for the changes to take effect.

```bash
$ npm run compile

```

### Testing

The unit tests can be run by using the following command. This will also use nyc to report coverage statistics.

```bash
$ npm test
```

## Running

There is currently no way to run the SGML tool, however there is a public interface for the compiler which can be used from a simple harness. The following script simply parses a script and then traverses the AST to print the script to the console. If the parser is working properly, the printed result should exactly match the input.

```typescript
import { DiagnosticBag } from './diagnostics/diagnostic-bag';
import { Parser } from './parser/parser';
import { SyntaxKind } from './syntax/syntax-kind';
import { SyntaxToken } from './syntax/syntax-token';

const TEST_SCRIPT =
  `with (instance_create(x, y, obj_Ball))
{
  speed = other.speed;
  direction = other.direction;
}
`;

// create a new parser
const parser = new Parser(TEST_SCRIPT, new DiagnosticBag());

// get a root node.
const root = parser.parseRoot();

// traverse each child in the root node.
root.forEachChild((child) => {
  // if the child is a token.
  if (child.kind > SyntaxKind.FirstToken && child.kind < SyntaxKind.LastToken) {
    const leadingTrivia = (child as SyntaxToken).leadingTrivia.map((trivia) => trivia.value);
    const trailingTrivia = (child as SyntaxToken).trailingTrivia.map((trivia) => trivia.value);

    // print that token in full fidelity.
    process.stdout.write(`${leadingTrivia.join('')}${(child as SyntaxToken).value}${trailingTrivia.join('')}`);
  }
});

// prints:
// with (instance_create(x, y, obj_Ball))
// {
//   speed = other.speed;
//   direction = other.direction;
// }

```
