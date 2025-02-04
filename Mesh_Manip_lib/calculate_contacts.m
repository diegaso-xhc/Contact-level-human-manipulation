function yf_cell = calculate_contacts(th, fr_in, Y, ob, y_track, vert_py, faces_py)

object = {};
hand = {};
yf_cell = {};
y_cell = {};
warning('off', 'MATLAB:triangulation:PtsNotInTriWarnId');
cnt = 0;

for i = 1: length(vert_py)
    disp(['Processing contact surface of frame: ', num2str(fr_in + i - 1)])
    cnt = cnt + 1;  
    object{1} = triangulation(Y{ob, 1}, y_track{i});
    hand{1} = triangulation(double(faces_py{i} + 1), vert_py{i});
    [yf y] = getContactSurfaces(object, hand, th, 'near');
    yf_cell{cnt} = yf;
    y_cell{cnt} = y;    
end



% load('verts_opt_V2_nob.mat')
% load('faces_opt_V2_nob.mat')
% 
% vert_nob = order_imported_matrix_n_row_cols(output_vertices);
% faces_nob = order_imported_matrix_n_row_cols(output_faces);
% 
% load('verts_opt_V2.mat')
% load('faces_opt_V2.mat')
% 
% vert = order_imported_matrix_n_row_cols(output_vertices);
% faces = order_imported_matrix_n_row_cols(output_faces);

% yf_cell_nob = {};
% y_cell_no = {};
% cnt = 0;
% for i = init_fr: end_fr
%     cnt = cnt + 1;  
%     object{1} = triangulation(Y{ob, 1}, y_track{i});
%     hand{1} = triangulation(double(faces_nob{i} + 1), vert_nob{i});
%     [yf y] = getContactSurfaces(object, hand, th, 'near');
%     yf_cell_nob{cnt} = yf;
%     y_cell_no{cnt} = y;
%     cnt
% end


end