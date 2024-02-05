function array = inputArray(tStart, tEnd, size, times)

array = [zeros(1,tStart-1),size*ones(1,tEnd-tStart+1),zeros(1,(length(times)-tEnd))];

end