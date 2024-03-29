function w = get_w()
  w = kron(ket(0,2), ket(0,2), ket(1,2))*kron(bra(0,2), bra(0,2), bra(1,2)) +...
      kron(ket(0,2), ket(1,2), ket(0,2))*kron(bra(0,2), bra(0,2), bra(1,2)) +...
      kron(ket(1,2), ket(0,2), ket(0,2))*kron(bra(0,2), bra(0,2), bra(1,2)) +...
      kron(ket(0,2), ket(0,2), ket(1,2))*kron(bra(0,2), bra(1,2), bra(0,2)) +...
      kron(ket(0,2), ket(1,2), ket(0,2))*kron(bra(0,2), bra(1,2), bra(0,2)) +...
      kron(ket(1,2), ket(0,2), ket(0,2))*kron(bra(0,2), bra(1,2), bra(0,2)) +...
      kron(ket(0,2), ket(0,2), ket(1,2))*kron(bra(1,2), bra(0,2), bra(0,2)) +...
      kron(ket(0,2), ket(1,2), ket(0,2))*kron(bra(1,2), bra(0,2), bra(0,2)) +...
      kron(ket(1,2), ket(0,2), ket(0,2))*kron(bra(1,2), bra(0,2), bra(0,2));
  w = 1/3 * w;
endfunction