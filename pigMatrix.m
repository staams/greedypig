function M = pigMatrix(n)
    %creates a matrix of the form
    %0, 0, 1/6, 1/6, 1/6, 1/6, 1/6, 0, 0, ..., 0, 1/6 
    %0, 0, 0, 1/6, ...
    %...
    %0, 0, 0, ........., 1/6, 1/6, 1/6, 1/6, 1/6, 1/6
    %0, 0, 0, .............., 1,     0,   0,   0,   0
    %...
    %0, 0, ....................................0,   1
    %The entry Mij is the probability of going from i points to j points, 
    %So if i-1>=n then Mii = 1 and Mij = 0
    %otherwise Mi(i + a) = 1/6, where a = [2, ..., 6]
    %The row n+7 is reserved for the pig state (you rolled a 1)
    %Be carefull row i corresonds to a state of i-1 points
    ilist = [];
    jlist = [];
    vlist = [];
    for i = 1:n
       for j = i+2:i+6 %this takes care of the diagonal part
           ilist = [ilist, i];
           jlist = [jlist, j];
           vlist = [vlist, 1/6];
       end
       ilist = [ilist, i];
       jlist = [jlist, n+7];
       vlist = [vlist, 1/6];
    end
    for i = n+1:n+7 %this takes care of the 1s at the end
        ilist = [ilist, i];
        jlist = [jlist, i];
        vlist = [vlist, 1];
    end
    M = sparse(ilist, jlist, vlist, n+7, n+7);
    
end