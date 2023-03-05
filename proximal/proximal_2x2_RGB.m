function out = proximal_2x2_RGB(img, STEP = 0.1)
    % ==============================================================================================
    % Aplica Interpolare Proximala pe imaginea 2 x 2 definita img cu puncte intermediare echidistante.
    % img este o imagine colorata RGB -Red, Green, Blue.
    % =============================================================================================

    % TODO: Extrage canalul rosu al imaginii.
    redcanal = img(:,:,1);
    % TODO: Extrage canalul verde al imaginii.
    greencanal = img(:,:,2);
    % TODO: Extrage canalul albastru al imaginii.
    bluecanal = img(:,:,3);
    % TODO: Aplic? functia proximal pe cele 3 canale ale imaginii.
    redcanal = proximal_2x2(redcanal, STEP);
    greencanal = proximal_2x2(greencanal, STEP);
    bluecanal = proximal_2x2(bluecanal, STEP);    
    % TODO: Formeaza imaginea finala concatenând cele 3 canale de culori.  
    out = cat(3, redcanal, greencanal, bluecanal); 
endfunction
