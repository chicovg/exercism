export const toRna = strain => [...strain].map(toComplement).join('');

const toComplement = nucleotide => complements[nucleotide];

const complements = {
    G: 'C',
    C: 'G',
    T: 'A',
    A: 'U'
};
