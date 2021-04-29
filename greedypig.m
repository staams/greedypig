function greedypig()
    scorelist = [];
    Ppig = [];
    for n = 1:50
            M = pigMatrix(n);
            S = mpower(M, ceil(n/2)); %The game always ends after n/2 turns, as the worst case is just rolling 2s a lot of times
            Pfinal = sparse(1,1,1,1,n+7)*S;
            Escore = dot([0:n+5, 0], Pfinal);
            scorelist = [scorelist, Escore];
            Ppig = [Ppig, Pfinal(1, n+7)];
    end
    yyaxis left
    bar(1:50, scorelist);
    ylabel('Expected score')
    xlabel('Point goal')
    hold on
    yyaxis right
    ylabel('Scoring chance')
    plot(1:50, 1 - Ppig);
    hold off
end