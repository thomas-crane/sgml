export interface Source {
  name: string;
  contents(): Promise<string>;
}
