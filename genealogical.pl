% Gender of each member is stated.
male(jamilu).
male(ibrahim).
male(yusuf).
male('Mr umar').
male('Mr Bode').
male('Mr Afeez ').
male('Mr Lawal').
male('Mr Sodiq ').
male('Mr Abass').
male('Uncle Wale').
male('Uncle Ade').
male('Mr zaid').

female(jamila).
female(zainab).
female(yusra).
female('Mrs umar').
female('Mrs ade').
female('Mrs Ruqoya ').
female('Mrs Aisha ').
female('Mrs Alia ').
female('Mrs halima').
female('Aunt Kemi').
female('Aunt zee').
female('Mrs Wala').

% Parent-child relatonship.

parent('Mr Umar', jamilu).
parent('Mrs Umar', jamilu).
parent('Mr Umar', zainab).
parent('Mrs Umar', zainab).
parent('Mr Ade',ibrahim).
parent('Mrs Ade', ibrahim).
parent('Mr Ade',yusra).
parent('Mrs Ade', yusra).
parent('Uncle Wale', jamila).
parent('Mrs Wala', jamila).
parent('Mr zaid', yusuf).
parent('Aunt zee', yusuf).

parent('Mrs Ruqoya ', 'Mr Umar').
parent('Mr Afeez ', 'Mr Umar').
parent('Mrs Alia ','Mrs Umar' ).
parent('Mr Sodiq', 'Mrs Umar').

parent('Mrs Ruqoya', 'Uncle Wale').
parent('Mr Afeez ', 'Uncle Wale').

parent('Mrs Ruqoya ','Aunt Kemi').
parent('Mr Afeez ', 'Aunt Kemi').

parent('Mrs Aisha', 'Mr Ade').
parent('Mr Lawal', 'Mr Ade').
parent('Mrs halima', 'Mrs Ade').
parent('Mr Abass', 'Mrs Ade').

parent('Mrs halima','Uncle Sola').
parent('Mr Abass', 'Uncle Sola').

parent('Mrs halima', 'Aunt zee').
parent('Mr Abass', 'Aunt zee').


% grandparent to child relationship.
grand_parent('Mrs Ruqoya',jamilu).
grand_parent('Mr Afeez',jamilu).
grand_parent('Mrs Alia',jamilu).
grand_parent('Mr Sodiq',jamilu).

grand_parent('Mrs Ruqoya',zainab).
grand_parent('Mr Afeez',zainab).
grand_parent('Mrs Alia',zainab).
grand_parent('Mr Sodiq',zainab).

grand_parent('Mrs Ruqoya',jamila).
grand_parent('Mr Afeez',jamila).

grand_parent('Mrs Aisha',yusra).
grand_parent('Mr Lawal',yusra).
grand_parent('Mrs halima',yusra).
grand_parent('Mr Abass',yusra).

grand_parent('Mrs Aisha',ibrahim).
grand_parent('Mr Lawal',ibrahim).
grand_parent('Mrs halima',ibrahim).
grand_parent('Mr Abass',ibrahim).

grand_parent('Mrs halima',yusuf).
grand_parent('Mr Abass',yusuf).

% rule for mother
mother(M,C):-parent(M,C), female(M).

% rule for father
father(M,C):-parent(M,C), male(M).
son(M):- parent(M,C), male(C), tab(2), write(C), nl, fail.
daughter(M):- parent(M,C), female(C), tab(2), write(C), nl, fail.
 % rule for sibling
sibling(M,C):- parent(X,C),parent(X,M).

% rules for brothers, sisters, uncles, aunts, and cousins.
brother(M, C):- parent(X,C),parent(X,M),male(M).
sister(M, C):-  parent(X,C),parent(X,M),female(M).

uncle(M,C):- sibling(M,N), parent(N,C), male(M).
aunt(M,C):- sister(M, N), parent(N,C).
cousine(M,C):- grand_parent(X,M), grand_parent(X,C).

% Gender and connections
spouse('Mr Umar', 'Mrs Umar').
spouse('Mr Ade', 'Mrs Ade').
spouse('Uncle Wale', 'Mrs Wale').
spouse('Mr zaid', 'Aunt zee').
spouse('Mr Afeez', 'Mrs Rukoya').
spouse('Mr Sodiq', 'Mrs Alia').
spouse('Mr Lawal', 'Mrs Aisha').
spouse('Mr Abass', 'Mrs halima').

marraige(X,Y):- spouse(X,Y).
marraige(X,Y):- spouse(Y,X).


% rules connecting uncle and aunt together either 
% by blood or by marraige child().

% predicate to find both grandparent and grandchild
grandparent(Y,X):-parent(A,X),parent(Y,A).
grandparent(X,Y):-parent(X,A),parent(A,Y).
.
