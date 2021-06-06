clc;
clear;
close all;

namaKaryawan = {'Brian' 'AloenZx' 'Rein' 'Deity' 'LostVoice' 'Gandhi' 'Viletto' 'Gandhum' 'Zahra' 'BfGf'};


TFN = {  [-100/9 0 100/9] [9/100 0 -9/100]
         [0 100/9 200/9] [9/200 9/100 0]
         [100/9 200/9 300/9] [9/300 9/200 9/100]
         [200/9 300/9 400/9] [9/400 9/300 9/200]
         [300/9 400/9 500/9] [9/500 9/400 9/300]
         [400/9 500/9 600/9] [9/600 9/500 9/400]
         [500/9 600/9 700/9] [9/700 9/600 9/500]
         [600/9 700/9 800/9] [9/800 9/700 9/600]
         [700/9 800/9 900/9] [9/900 9/800 9/700]
         [800/9 900/9 1000/9] [9/1000 9/900 9/800]};


dataawal = [80 75 60 
        70 65 70
        90 55 80 
        60 80 90
        50 60 70
        40 70 60
        80 90 40
        80 80 60
        50 60 80
        80 60 60];

maksKonsistensiPerfomance = 100;
maksKDA = 100;
maksSikap = 100;

data(:,1)=dataawal(:,1)/maksKonsistensiPerfomance;
data(:,2)=dataawal(:,2)/maksKDA;
data(:,3)=dataawal(:,3)/maksSikap;


relasiAntarKriteria = [1 2 0.5
                       0 1 1/3
                       0 0 1];

RasioKonsistensi=HitungKonsistensiAHP(relasiAntarKriteria);

if RasioKonsistensi<0.10
    [bobotAntarKriteria,relasiAntarKriteria]=FuzzyAHP(relasiAntarKriteria,TFN);
    
    ahp = data*bobotAntarKriteria';
    
    disp('Hasil Perhitungan dengan metode Fuzzy AHP');
    disp('Nama Player,Skor Akhir,Kesimpulan');
end
    for i =1:size(ahp,1)
       
    if ahp(i)<0.6
        status='Kurang';
    elseif ahp(i)<0.7
        status='Cukup';
    elseif ahp(i)<0.8
        status='Baik';
    else
        status='Sangat Baik';
    end
    
    disp([char(namaKaryawan(i)),blanks(13-cellfun('length',namaKaryawan(i))),',',...
        num2str(ahp(i)),blanks(10-length(num2str(ahp(i)))),',',...
        char(status)])
     
    end
    