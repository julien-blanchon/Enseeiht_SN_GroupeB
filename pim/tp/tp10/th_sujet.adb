-- Exemple d'utilisation du module TH.
with Ada.Text_IO;           use Ada.Text_IO;
with Ada.Integer_Text_IO;   use Ada.Integer_Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
	--! Les Unbounded_String ont une capacité variable, contrairement au String
	--! pour lesquelles une capacité doit être fixée.
with TH;

procedure TH_Sujet is
	-- Capacite des TH du type TH_String_Integer.
	Capacite: constant Integer := 100;

	-- Fonction de Hashage du type TH_String_Integer.
	function MonHashage(Cle: Unbounded_String) return Integer is
	begin
		return (Length(Cle) MOD Capacite) + 1;
	end MonHashage;

	-- Instanciation générique du type TH_String_Integer.
	package TH_String_Integer is
		new TH (T_Cle => Unbounded_String,
			T_Donnee => Integer,
			Capacite => Capacite,
			Hashage => MonHashage);
	use TH_String_Integer;

	Mon_TH : TH_String_Integer.T_TH; --! Ou simplement T_TH;

	-- Afficher une Unbounded_String et un entier.
	procedure Afficher (S : in Unbounded_String; N: in Integer) is
	begin
		Put (To_String(S));
		Put (" : ");
		Put (N, 1);
		New_Line;
	end Afficher;

	-- Instanciation générique de la procedure Afficher_Pour_Chaque.
	procedure Afficher_Pour_Chaque is
		new Pour_Chaque (Afficher);

begin
	Initialiser (Mon_TH);
	Enregistrer (Mon_TH, To_Unbounded_String("un"), 1);
	--! Mon_TH[3] = {"un": 1}->Null
	Enregistrer (Mon_TH, To_Unbounded_String("deux"), 2);
	--! Mon_TH[5] = {"deux": 2}->Null
	--Enregistrer (Mon_TH, To_Unbounded_String("quatre"), 4);
	--! Mon_TH[7] = {"quatre": 4}->Null
	--Enregistrer (Mon_TH, To	_Unbounded_String("sept"), 7);
	--! Mon_TH[5] = {"deux": 2}->{"sept": 7}->Null
	--Enregistrer (Mon_TH, To_Unbounded_String("quatre"), 44);
	--! Mon_TH[7] = {"quatre": 44}->Null
	Afficher_Pour_Chaque (Mon_TH);
	Vider (Mon_TH);
	--! Mon_TH[..] = [Null; ... ; Null]
end TH_Sujet;
