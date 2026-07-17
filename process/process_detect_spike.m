function varargout = process_detect_spike( varargin )
% process_detect_spike: Detect spike using spikenet1
%
% USAGE:      sProcess = process_detect_spike('GetDescription')
%               sInput = process_detect_spike('Run', sProcess, sInput)
%                    x = process_detect_spike('Compute', F, iTime)

% @=============================================================================
% This function is part of the Brainstorm software:
% https://neuroimage.usc.edu/brainstorm
% 
% Copyright (c) University of Southern California & McGill University
% This software is distributed under the terms of the GNU General Public License
% as published by the Free Software Foundation. Further details on the GPLv3
% license can be found at http://www.gnu.org/copyleft/gpl.html.
% 
% FOR RESEARCH PURPOSES ONLY. THE SOFTWARE IS PROVIDED "AS IS," AND THE
% UNIVERSITY OF SOUTHERN CALIFORNIA AND ITS COLLABORATORS DO NOT MAKE ANY
% WARRANTY, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO WARRANTIES OF
% MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE, NOR DO THEY ASSUME ANY
% LIABILITY OR RESPONSIBILITY FOR THE USE OF THIS SOFTWARE.
%
% For more information type "brainstorm license" at command prompt.
% =============================================================================@
%
% Authors: 

eval(macro_method);
end


%% ===== GET DESCRIPTION =====
function sProcess = GetDescription() 

    % Description the process
    sProcess.Comment     = 'Detect spike (spikenet1)';
    sProcess.FileTag     = 'spikenet';
    sProcess.Category    = 'File';
    sProcess.SubGroup    = 'Events';
    sProcess.Index       = 200;
    sProcess.Description = '';
    % Definition of the input accepted by this process
    sProcess.InputTypes  = {'data'};
    sProcess.OutputTypes = {'data'};

    sProcess.options.model_label.Comment = '<b><u>Model</u></b>';
    sProcess.options.model_label.Type    = 'label';


    sProcess.options.montage_label.Comment = '<b><u>Montage</u></b>';
    sProcess.options.montage_label.Type    = 'label';

    % Channel name = {'FP1','F3','C3','P3','F7','T3','T5','O1','FZ','CZ','PZ','FP2','F4','C4','P4','F8','T4','T6','O2'};

    sProcess.options.channelname_Fp1.Comment = 'Fp1: ';
    sProcess.options.channelname_Fp1.Type    = 'channelname';
    sProcess.options.channelname_Fp1.Value   = '';

    sProcess.options.channelname_F3.Comment = 'F3: ';
    sProcess.options.channelname_F3.Type    = 'channelname';
    sProcess.options.channelname_F3.Value   = '';

    sProcess.options.channelname_C3.Comment = 'C3: ';
    sProcess.options.channelname_C3.Type    = 'channelname';
    sProcess.options.channelname_C3.Value   = '';

    sProcess.options.channelname_P3.Comment = 'P3: ';
    sProcess.options.channelname_P3.Type    = 'channelname';
    sProcess.options.channelname_P3.Value   = '';

    sProcess.options.channelname_F7.Comment = 'F7: ';
    sProcess.options.channelname_F7.Type    = 'channelname';
    sProcess.options.channelname_F7.Value   = '';

    sProcess.options.channelname_T3.Comment = 'T3: ';
    sProcess.options.channelname_T3.Type    = 'channelname';
    sProcess.options.channelname_T3.Value   = '';

    sProcess.options.channelname_T5.Comment = 'T5: ';
    sProcess.options.channelname_T5.Type    = 'channelname';
    sProcess.options.channelname_T5.Value   = '';

    sProcess.options.channelname_O1.Comment = 'O1: ';
    sProcess.options.channelname_O1.Type    = 'channelname';
    sProcess.options.channelname_O1.Value   = '';

    sProcess.options.channelname_Fz.Comment = 'FZ: ';
    sProcess.options.channelname_Fz.Type    = 'channelname';
    sProcess.options.channelname_Fz.Value   = '';

    sProcess.options.channelname_Cz.Comment = 'Cz: ';
    sProcess.options.channelname_Cz.Type    = 'channelname';
    sProcess.options.channelname_Cz.Value   = '';

    sProcess.options.channelname_Pz.Comment = 'Pz: ';
    sProcess.options.channelname_Pz.Type    = 'channelname';
    sProcess.options.channelname_Pz.Value   = '';

    sProcess.options.channelname_Fp2.Comment = 'FP2: ';
    sProcess.options.channelname_Fp2.Type    = 'channelname';
    sProcess.options.channelname_Fp2.Value   = '';

    sProcess.options.channelname_F4.Comment = 'F4: ';
    sProcess.options.channelname_F4.Type    = 'channelname';
    sProcess.options.channelname_F4.Value   = '';

    sProcess.options.channelname_C4.Comment = 'C4: ';
    sProcess.options.channelname_C4.Type    = 'channelname';
    sProcess.options.channelname_C4.Value   = '';

    sProcess.options.channelname_P4.Comment = 'P4: ';
    sProcess.options.channelname_P4.Type    = 'channelname';
    sProcess.options.channelname_P4.Value   = '';

    sProcess.options.channelname_F8.Comment = 'F8: ';
    sProcess.options.channelname_F8.Type    = 'channelname';
    sProcess.options.channelname_F8.Value   = '';

    sProcess.options.channelname_T4.Comment = 'T4: ';
    sProcess.options.channelname_T4.Type    = 'channelname';
    sProcess.options.channelname_T4.Value   = '';

    sProcess.options.channelname_T6.Comment = 'T6: ';
    sProcess.options.channelname_T6.Type    = 'channelname';
    sProcess.options.channelname_T6.Value   = '';

    sProcess.options.channelname_O2.Comment = 'O2: ';
    sProcess.options.channelname_O2.Type    = 'channelname';
    sProcess.options.channelname_O2.Value   = '';

    sProcess.options.event_label.Comment = '<b><u>Events</u></b>';
    sProcess.options.event_label.Type    = 'label';

    sProcess.options.option_threshold.Comment = 'Threshold';
    sProcess.options.option_threshold.Type    = 'value';
    sProcess.options.option_threshold.Value   = {0.6, '', 2};

    sProcess.options.option_event_name.Comment = 'Output event name:';
    sProcess.options.option_event_name.Type    = 'text';
    sProcess.options.option_event_name.Value   = 'spike';

    % === OUTPUT MODE
    sProcess.options.outputmode.Comment = 'Save model pprediction';
    sProcess.options.outputmode.Type    = 'checkbox';
    sProcess.options.outputmode.Value   = 1;
    sProcess.options.outputmode.Group   = 'output';


    sProcess.nInputs     = 1;
    sProcess.nMinFiles   = 1;
end


%% ===== FORMAT COMMENT =====
function Comment = FormatComment(sProcess) %#ok<DEFNU>
    Comment = sProcess.Comment;
end


%% ===== RUN =====
function OutputFile = Run(sProcess, sInput) 
    
    OutputFile = {};

    % Load Data
    sData       = in_bst_data(sInput.FileName);
    sChannels   = in_bst_channel(sInput.ChannelFile);
    channel_map = get_channel_mapping(sProcess);
    [data, Fs]        =  prepare_data(sChannels, sData, channel_map);
    
    % Move to a tmp dir, so the model can create +spikenet1
    currentDirectory = pwd;
    cleanUp = onCleanup(@() cd(currentDirectory));
    cd(bst_get('BrainstormTmpDir'));

    % Load deep learning network
    PlugDesc = bst_plugin('GetInstalled', 'spikenet');
    model_file = fullfile(PlugDesc.Path,PlugDesc.SubFolder, 'models', 'spikenet1.onnx');
    net = importNetworkFromONNX(model_file, "InputDataFormats", "BCSS");
    %deepNetworkDesigner(net)

    
    % Start predictions
    N_sample = size(data, 2);
    batch_size  = 1000;
    
    start_ids = 1:1:(N_sample - 128 + 1); 
    nb_batches = ceil(length(start_ids) / batch_size);
    
    yp = [];
    bst_progress('start', 'Spikenet1', 'Predicting spike probabilities using spikenet1...', 0, nb_batches);
    for iBatch = 1:nb_batches
        idx_start = (iBatch-1)*batch_size + 1;
        idx_end = min(iBatch*batch_size, length(start_ids));
        batch_ids = start_ids(idx_start:idx_end);
        current_batch_size = length(batch_ids);
        
       
        X_batch = zeros(current_batch_size, Fs, size(data, 1), 1, 'single');
        
        for i = 1:current_batch_size
            t_start = batch_ids(i);
            fenetre = data(:, t_start:t_start+Fs-1); 
            X_batch(i, :, :, 1) = single(fenetre.'); 
        end
        
        
        dlX = dlarray(X_batch, "BCSS");
        dlY = predict(net, dlX);
        
       
        prediction_batch = extractdata(dlY);
        yp = [yp; prediction_batch(:)];

        bst_progress('inc', 1);
    end
    bst_progress('stop')

    %% 3. Alignement et Sauvegarde
    padleft = floor((N_sample - length(yp)) / 2);
    padright = N_sample - length(yp) - padleft;
    yp_final = [zeros(padleft, 1) + yp(1); repelem(yp, 1); zeros(padright, 1) + yp(end)];


    %% 4. Affichage du graphique final
    t = (0:length(yp_final)-1) / Fs;
    figure('Position', [100, 100, 1200, 350]);
    plot(t, yp_final, 'LineWidth', 1.5, 'Color', [0.8500 0.3250 0.0980]); 
    xlabel('Time (s)');
    ylabel('Score');
    title(['Prédiction Native MATLAB (100% OK)'], 'Interpreter', 'none');
    grid on;

    %% Generate events


    spike_time = getEvents(sData.Time, yp_final, sProcess.options.option_threshold.Value{1});

    sData.Events(end+1) = db_template('Event');
    iEvent = length(sData.Events);
    
    sData.Events(iEvent).label = file_unique(sProcess.options.option_event_name.Value, {sData.Events.label}, 0);
    sData.Events(iEvent).times = spike_time;
    sData.Events(iEvent).epochs = ones(1,length(spike_time));
    sData.Events(iEvent).color = panel_record('GetNewEventColor', 1, iEvent);
    sData.Events(iEvent).channels = cell(1, size(sData.Events(iEvent).times, 2));
    sData.Events(iEvent).notes = cell(1, size(sData.Events(iEvent).times, 2));

    bst_save(file_fullpath(sInput.FileName), sData);

    % Save in Brainstorm
    if sProcess.options.outputmode.Value
        % Save time-series data
        sDataOut = sData;
        sDataOut.F            = 100 * repmat(yp_final', size(sData.F,1), 1); 
        sDataOut.Comment      = [sInput.Comment ' | Spikenet1'];
        sDataOut.DisplayUnits = '%';
        sDataOut = bst_history('add', sDataOut, 'process', 'Spikenet prediction');
        
        [sStudy, iStudy] = bst_get('Study', sInput.iStudy);
        % Generate a new file name in the same folder
        OutputFile = bst_process('GetNewFilename', bst_fileparts(sStudy.FileName), 'data_sppikenet_prediction');
        sDataOut.FileName = file_short(OutputFile);
        bst_save(OutputFile, sDataOut, 'v7');
        % Register in database
        db_add_data(iStudy, OutputFile, sDataOut);
    end

end

function channel_map = get_channel_mapping(sProcess)

    channel_map = cell(19, 2);
    options = sProcess.options;

    keys = fieldnames(options);
    keys = keys(contains(keys, 'channelname'));

    for iKey = 1:length(keys)

        str_key = keys{iKey};
        str_value = options.(str_key).Value;

        tmp = strsplit(str_key, '_');
        channel_map{iKey, 1} = tmp{2};
        channel_map{iKey, 2} = str_value;
    end

end


function [data, Fs, channels] = prepare_data(sChannels, sData, channel_map)
    

    Fs               = 1/(sData.Time(2) - sData.Time(1));
    channels         = {sChannels.Channel.Name}' ;
    assert(Fs == 128, 'Sampling rate of the data must be 128 Hz')

    momopolar_channels = {'FP1','F3','C3','P3','F7','T3','T5','O1','FZ','CZ','PZ','FP2','F4','C4','P4','F8','T4','T6','O2'};
    bipolar_channels = {'FP1-F7','F7-T3','T3-T5','T5-O1','FP2-F8','F8-T4','T4-T6','T6-O2','FP1-F3','F3-C3','C3-P3','P3-O1','FP2-F4','F4-C4','C4-P4','P4-O2','FZ-CZ','CZ-PZ'};

    channel_order   = nan(1, length(momopolar_channels));
    not_found       = {};

    for iChannel = 1:length(momopolar_channels)

        tmp = find(strcmpi(channel_map(:,1), momopolar_channels{iChannel}));
        target_channel = find(strcmp({sChannels.Channel.Name}, channel_map(tmp, 2)));

        if isempty(target_channel)
            not_found{end+1} = momopolar_channels{iChannel};
            continue;
        end

        channel_order(iChannel) = target_channel;
    end

    if ~isempty(not_found)
        bst_error(sprintf('Unable to find the following channels %s', strjoin(not_found, ', ')));
        return;
    end

    data_reordered      = sData.F(channel_order, :) * 1e6;
    average_data = data_reordered - mean(data_reordered, 1);
    bipolar_data = zeros(numel(bipolar_channels), size(data_reordered, 2));

    for i = 1:numel(bipolar_channels)
        parts = split(bipolar_channels{i}, '-');
        ch1 = parts{1};
        ch2 = parts{2};

        idx1 = find(strcmp(momopolar_channels, ch1));
        idx2 = find(strcmp(momopolar_channels, ch2));

        bipolar_data(i, :) = data_reordered(idx1, :) - data_reordered(idx2, :);
    end
    
    data = [average_data; bipolar_data];
    channels = [momopolar_channels,  bipolar_channels];

end

function peaks_time = getEvents(time, yp_final,threshold)
    [~, peaks_time] = findpeaks(yp_final, time, 'MinPeakHeight', threshold);
end