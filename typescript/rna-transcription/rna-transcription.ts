function toComplement(nucleotide: string): string {
  switch (nucleotide) {
      case 'C': return 'G'
      case 'G': return 'C'
      case 'A': return 'U'
      case 'T': return 'A'
      default: throw Error('Invalid input DNA.')
  }
}

export function toRna(dna: string): string {
  return dna.split('').map(toComplement).join('');
}
