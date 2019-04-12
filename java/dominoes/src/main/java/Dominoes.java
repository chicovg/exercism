import java.util.ArrayList;
import java.util.List;
import java.util.Queue;
import java.util.LinkedList;
import java.util.stream.Collectors;

public class Dominoes {
    public List<Domino> formChain(List<Domino> dominoes) throws ChainNotFoundException {
        return formChain(new LinkedList<>(dominoes), new ArrayList<>());
    }

    private List<Domino> formChain(List<Domino> dominoes, List<Domino> chain) throws ChainNotFoundException {
        if (dominoes.isEmpty()) {
            if (!chain.isEmpty()) {
                Domino first = chain.get(0);
                Domino last = chain.get(chain.size() - 1);
                if (first.getLeft() != last.getRight()) {
                    throw new ChainNotFoundException("No domino chain found.");
                }
            }
            return chain;
        }

        if (chain.isEmpty()) {
            chain.add(dominoes.remove(0));
            return formChain(dominoes, chain);
        }

        Domino last = chain.get(chain.size() - 1);

        for (int i = 0; i < dominoes.size(); i++) {
            Domino domino = dominoes.remove(0);

            try {
                if (canChain(last, domino)) {
                    chain.add(domino);
                    return formChain(dominoes, chain);
                }
                if (canChainReversed(last, domino)) {
                    domino = flip(domino);
                    chain.add(domino);
                    return formChain(dominoes, chain);
                }
            } catch (ChainNotFoundException e) {
                chain.remove(domino);
            } finally {
                dominoes.add(domino);
            }
        }

        throw new ChainNotFoundException("No domino chain found.");
    }

    private boolean canChain(Domino base, Domino other) {
        return base.getRight() == other.getLeft();
    }

    private boolean canChainReversed(Domino base, Domino other) {
        return base.getRight() == other.getRight();
    }

    private Domino flip(Domino domino) {
        return new Domino(domino.getRight(), domino.getLeft());
    }
}
