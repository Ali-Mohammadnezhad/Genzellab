function [lfp_mat_cSWR_end, lfp_mat_Ripp_end, lfp_mat_SW_end, lfp_mat_SWR_end] = EndAlignment(dataFilePath)
    % Reading data file and extracting channels
    DataChannels = load(dataFilePath);
    structure_Name = fieldnames(DataChannels);
    % Initializing variables
    lfp_mat_cSWR_end = [];
    lfp_mat_Ripp_end = [];
    lfp_mat_SW_end = [];
    lfp_mat_SWR_end = [];
    HH                  = 'False';
    idxS                = 601;
% lopping through different events and structures 
    for iStr = 1:size(structure_Name,1)-1
           Events_extr = DataChannels.(structure_Name{iStr});% extract different events
           if iStr == 1
        % we extract the events of complex sharp wave events 
               SingleEvents1                           = Events_extr.waveforms;
               EventsTable1                            = Events_extr.grouped_oscil_table;
               idx_end1                                = EventsTable1.Six_End;
               for iSingEvent1 = 1:size(SingleEvents1,1)
                      twin1                               = [idx_end1(iSingEvent1)-120 idx_end1(iSingEvent1)+120];
                      lfp1                                = SingleEvents1{iSingEvent1};
                      lfp_mat_cSWR_end(:,:,iSingEvent1)       = lfp1(:,twin1(1):twin1(2));
               end
           end
          if iStr == 2
        % we extract the events of ripple without sharp waves  
              SingleEvents2                           = Events_extr.waveforms;
              EventsTable2                            = Events_extr.grouped_oscil_table;
              idx_end2                                = EventsTable2.Six_End;
              for iSingEvent2 = 1:size(SingleEvents2,1)
                     twin2                               = [idx_end2(iSingEvent2)-120 idx_end2(iSingEvent2)+120];
                     lfp2                                = SingleEvents2{iSingEvent2};
                     lfp_mat_Ripp_end(:,:,iSingEvent2)       = lfp2(:,twin2(1):twin2(2));
              end
          end
          if iStr == 3
        % we extract the events of ripple without sharp waves  
              SingleEvents3                           = Events_extr.waveforms;
              EventsTable3                            = Events_extr.grouped_oscil_table;
              idx_end3                                = EventsTable3.Six_End;
              for iSingEvent3 = 1:size(SingleEvents3,1)
                    twin3                               = [idx_end3(iSingEvent3)-120 idx_end3(iSingEvent3)+120];
                    lfp3                                = SingleEvents3{iSingEvent3};
                    lfp_mat_SW_end(:,:,iSingEvent3)         = lfp3(:,twin3(1):twin3(2));
              end
          end
          if iStr == 4
        % we extract the events of ripple without sharp waves  
              SingleEvents4                           = Events_extr.waveforms;
              EventsTable4                            = Events_extr.grouped_oscil_table;
              idx_end4                                = EventsTable4.Six_End;
              for iSingEvent4 = 1:size(SingleEvents4,1)
                     twin4                               = [idx_end4(iSingEvent4)-120 idx_end4(iSingEvent4)+120];
                     lfp4                                = SingleEvents4{iSingEvent4};
                     lfp_mat_SWR_end(:,:,iSingEvent4)        = lfp4(:,twin4(1):twin4(2));
              end
          end
    end 
disp('Finished')
end
