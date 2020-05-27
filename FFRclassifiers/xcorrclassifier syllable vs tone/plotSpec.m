

function plotSpec(signal,fs,freqBand,wl,wo)

    figure;
   
    subplot(121);

      t = linspace(0,100,length(signal));
      plot(t,signal,'b','linewidth',2);
      set(gca,'fontsize',15,'fontweight','bold','fontName','Arial','linewidth',2);
      axis tight;
      box off
      xlabel('Time [ms]','fontsize',20);
      ylabel('Magnitude [uV]','fontsize',20);
      title('Waveform','fontsize',20);

    subplot(122);
    
      [s,f,t,ps] = spectrogram(signal,hamming(fs*wl),floor(fs*wo),fs,fs);
      idx = find(f>=freqBand(1)&f<=freqBand(2));
      f = f(idx);
      db = pow2db(ps(idx,:));
      t = linspace(0,length(signal)/fs,length(t));
      [x y] = meshgrid(t,f);
      colormap jet;
      surf(x,y,db);
      shading interp;
      axis tight;
      view([0 90]);
      set(gca,'linewidth',2,'fontsize',15,'fontName','Arial','fontweight','bold','yaxislocation','right',...
      'ytick',linspace(freqBand(1),freqBand(2),5));
      xlabel('Time [ms]','fontsize',20);
      ylabel('Freq. [Hz]','fontsize',20);
      title('Spectrogram','fontsize',20);

    set(gcf,'position',[150 150 1000 400])

end

