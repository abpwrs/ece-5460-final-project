%% ECE:5460 Digital Signal Processing Final Project
% Alexander Powers

%% read data
src_dir = pwd();
filesep_idx = strfind(src_dir, filesep);
data_folder = strcat(src_dir(1:filesep_idx(end)), 'data', filesep);
[y, Fs] = audioread(strcat(data_folder, 'YannyLaurel.ogg'));

%%  play sound
soundsc(y, Fs)


%% shift negative semitones -- should hear higher frequencies more clearly (yanny)
semitones = -8;
lower_audio = shiftPitch(y, semitones);
soundsc(lower_audio, Fs);

%% shift positive semitones -- should hear lower frequencies more clearly (laurel)
semitones = 8;
higher_audio = shiftPitch(y, semitones);
soundsc(higher_audio, Fs);

%% generate a range of semitone shifted signals for the app to play

static_folder = strcat(src_dir(1:filesep_idx(end)), 'app', filesep, 'static', filesep);

for semitone=-15:3:15
    semitone_str = int2str(semitone);
    semitone_str = strrep(semitone_str, '-','n');
    out_filename = strcat(static_folder, semitone_str, '.ogg');
    shifted_audio = shiftPitch(y, semitone);
    soundsc(shifted_audio, Fs);
    pause(3)
    audiowrite(out_filename, shifted_audio, Fs);
end