import * as fs from 'fs';

export function readdir(path: fs.PathLike): Promise<string[]> {
  return new Promise((resolve, reject) => {
    fs.readdir(path, (err, files) => {
      if (err) {
        process.nextTick(reject, err);
      } else {
        process.nextTick(resolve, files);
      }
    });
  });
}

export function readFile(path: fs.PathLike): Promise<string> {
  return new Promise((resolve, reject) => {
    fs.readFile(path, { encoding: 'utf8' }, (err, contents) => {
      if (err) {
        process.nextTick(reject, err);
      } else {
        process.nextTick(resolve, contents);
      }
    });
  });
}
