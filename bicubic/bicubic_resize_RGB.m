function out = bicubic_resize_RGB(img, p, q)
    % =========================================================================
    % Redimensioneaza imaginea img astfel încât aceasta save fie de dimensiune p x q.
    % Imaginea img este colorata.
    % =========================================================================

    % TODO: Extrage canalul rosu al imaginii.
    redcanal = img(:,:,1);
    % TODO: Extrage canalul verde al imaginii.
    greencanal = img(:,:,2);
    % TODO: Extrage canalul albastru al imaginii.
    bluecanal = img(:,:,3);
    % TODO: Aplica functia bicubic pe cele 3 canale ale imaginii.
    redcanal = bicubic_resize(redcanal, p, q);
    greencanal = bicubic_resize(greencanal, p, q);
    bluecanal = bicubic_resize(bluecanal, p, q);
    % TODO: Formeaza imaginea finala concatenand cele 3 canale de culori.
    out = cat(3, redcanal, greencanal, bluecanal);
endfunction
