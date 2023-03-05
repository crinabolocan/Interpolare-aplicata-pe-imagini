function out = proximal_rotate_RGB(img, rotation_angle)
    % =========================================================================
    % Aplica Interpolarea Proximala pentru a roti o imagine RGB cu un unghi dat.
    % =========================================================================
    
    % TODO: Extrage canalul rosu al imaginii.
    redcanal = img(:,:,1);
    % TODO: Extrage canalul verde al imaginii.
    greencanal = img(:,:,2);
    % TODO: Extrage canalul albastru al imaginii.
    bluecanal = img(:,:,3);
    % TODO: Aplica rotatia pe fiecare canal al imaginii.
    redcanal = proximal_rotate(redcanal, rotation_angle);
    greencanal = proximal_rotate(greencanal, rotation_angle);
    bluecanal = proximal_rotate(bluecanal, rotation_angle);
    % TODO: Formeaza imaginea finala concatenând cele 3 canale de culori.
    out = cat(3, redcanal, greencanal, bluecanal);
endfunction