
donnees;

% Le rayon R_0 est inconnu :
R_0 = 8;

% Tirage aleatoire uniforme de positions du centre C : 
nb_tests = 100000;
R_tests = 2*R_0*randn(nb_tests, 1);
C_tests = (taille-R_0)*(2*randn(nb_tests,2)-1);
[C_estime, R_estime] = estimation_2(x_donnees_bruitees,y_donnees_bruitees,C_tests,R_tests);

% Affichage du cercle estime :
x_cercle_estime = C_estime(1) + R_estime*cos(theta_cercle);
y_cercle_estime = C_estime(2) + R_estime*sin(theta_cercle);
plot(x_cercle_estime([1:end 1]),y_cercle_estime([1:end 1]),'b','LineWidth',3);
lg = legend('~Cercle reel $(C_0,R_0)$', ...
		'~Donnees bruitees', ...
		'~Cercle estime $(C^*,R^*)$', ...
		'Location','Best');
set(lg,'Interpreter','Latex');