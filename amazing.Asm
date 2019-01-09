TITLE	A MAZE ING - An amazing maze game
.286
SSEG SEGMENT	STACK
	DB	32 DUP("STACK---")
SSEG ENDS
DSEG SEGMENT
		gagnem db 0,0,10,10,"Bien joue tu as reussie le labyrinthe !",13,10,10
			   db     "Arriveras-tu les niveaux suivants ?",13,10,10
			   db     "Appuie sur Entree pour un autre niveau !",'$'
	    perdum db 0,0,10,10,"Tu n'as pas finis dans l'etang ! ;)",13,10,10
	    	   db     "Appuie sur Entree pour un autre niveau !",'$'
		menujeu db 10,32,32,32,32,"///////////////////////////////",13,10
				db 32,32,32,32,"///       A MAZE ING        ///",13,10
				db 32,32,32,32,"///////////////////////////////",13,10,10,10,'$'
     	jouer db 9,32,32,32,32,32,32,"1) JOUER",13,10,10,'$'
     	quitter db 9,32,32,32,32,32,"2) QUITTER",13,10,10,'$'
     	menuniveau db 10,10,10,10,9,32,32,32,32,32,"1) Niveau 1 (30s)",13,10,10
     	     	   db 10,9,32,32,32,32,32,"2) Niveau 2 (1min)",13,10,10
     		       db 10,9,32,32,32,32,32,"3) Niveau 3 (1min)",13,10,10
     		       db 10,9,32,32,"**COMING SOON** (??ans)",13,10,10,'$'
     	niveau1    db 9,9,32,"NIVEAU 1",'$' 
     	niveau2    db 9,9,32,"NIVEAU 2",'$' 
     	niveau3    db 9,9,32,"NIVEAU 3",'$' 
     	j dw 85
		m dw 65
		ver11 dw 196
		hor11 dw 146
		ver12 dw 196
		hor12 dw 147
		ver21 dw 197
		hor21 dw 146
		ver22 dw 197
		hor22 dw 147
		ver dw 10
		hor dw 10
		timer dw 15
DSEG ENDS
cseg    segment  'CODE'
	assume  cs:cseg, ds:dseg, ss:sseg
start:
		push ds
		push 0
		mov ax,dseg
		mov ds,ax
		jmp menu
        ; ... put your code here ...
;-----------------------------------------------ESPACE MACRO---------------------------------------------;

;---------------------------------------;

mtimer macro bl
	mov ah,2ch
	int 21h
	cmp bl,dh
	je perdu
	   endm
;-----------------------------------------------------------;

;--------------------MACRO EFFACE ECRAN--------------------;
efecran	macro

		mov ah,06
		mov	al,00
		mov	bh,0
		mov	cx,0000
		mov	dx,184fh
		int	10h
			endm
;-----------------------------------------------------------;

;---------------------MACRO MUR NIVEAU 1--------------------;
murin1 macro
	mov j,85
	mov m,65
	bn1:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp j, 110 ;compare la valeur avec le max en verticale
	je bn2
	add j, 1
	jmp bn1
	bn2:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp m, 55 ;compare la valeur avec le max en verticale
	je bn3
	sub m, 1
	jmp bn2
	bn3:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp j, 100 ;compare la valeur avec le max en verticale
	je bn4
	sub j, 1
	jmp bn3
	bn4:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp m, 35 ;compare la valeur avec le max en verticale
	je bn5
	sub m, 1
	jmp bn4
	bn5:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp j, 125 ;compare la valeur avec le max en verticale
	je bn6
	add j, 1
	jmp bn5
	bn6:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp m, 80 ;compare la valeur avec le max en verticale
	je bn7
	add m, 1
	jmp bn6
	bn7:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp j, 100 ;compare la valeur avec le max en verticale
	je bn8
	sub j, 1
	jmp bn7
	bn8:
	mov j, 155
	mov m, 70
	bn8b:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp m, 110 ;compare la valeur avec le max en verticale
	je bn9
	add m, 1
	jmp bn8b
	bn9:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp j, 115 ;compare la valeur avec le max en verticale
	je bn10
	sub j, 1
	jmp bn9
	bn10:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp m,125 ;compare la valeur avec le max en verticale
	je bn11
	add m, 1
	jmp bn10
	bn11:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp j,130 ;compare la valeur avec le max en verticale
	je bn12
	add j, 1
	jmp bn11
	bn12:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp m,140 ;compare la valeur avec le max en verticale
	je bn13
	add m, 1
	jmp bn12
	bn13:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp j,175 ;compare la valeur avec le max en verticale
	je bn14
	add j, 1
	jmp bn13
	bn14:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp m,155 ;compare la valeur avec le max en verticale
	je bn15
	add m, 1
	jmp bn14
	bn15:
	mov j, 85
	mov m, 120
	bn15b:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp j,100 ;compare la valeur avec le max en verticale
	je bn16
	add j, 1
	jmp bn15b
	bn16:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp m,95 ;compare la valeur avec le max en verticale
	je bn17
	sub m, 1
	jmp bn16
	bn17:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp j,140 ;compare la valeur avec le max en verticale
	je bn18
	add j, 1
	jmp bn17
	bn18:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp m,70 ;compare la valeur avec le max en verticale
	je bn19
	sub m, 1
	jmp bn18
	bn19:
	mov j,140
	mov m, 55
	bn19b:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp j,170 ;compare la valeur avec le max en verticale
	je bn20
	add j, 1
	jmp bn19b
	bn20:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp m,70 ;compare la valeur avec le max en verticale
	je bn21
	add m, 1
	jmp bn20
	bn21:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp j,185 ;compare la valeur avec le max en verticale
	je bn22
	add j, 1
	jmp bn21
	bn22:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp m,105 ;compare la valeur avec le max en verticale
	je bn23
	add m, 1
	jmp bn22
	bn23:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp j,170 ;compare la valeur avec le max en verticale
	je bn24
	sub j, 1
	jmp bn23
	bn24:
	mov j,185
	mov m,120
	bn24b:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp j,200 ;compare la valeur avec le max en verticale
	je bn25
	add j, 1
	jmp bn24b
	bn25:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp m,135 ;compare la valeur avec le max en verticale
	je bn26
	add m, 1
	jmp bn25
	bn26:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp j,190 ;compare la valeur avec le max en verticale
	je bn27
	sub j, 1
	jmp bn26
	bn27:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp m,155 ;compare la valeur avec le max en verticale
	je bn28
	add m, 1
	jmp bn27
	bn28:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp j,220 ;compare la valeur avec le max en verticale
	je bn29
	add j, 1
	jmp bn28
	bn29:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp m,135 ;compare la valeur avec le max en verticale
	je bn30
	sub m, 1
	jmp bn29
	bn30:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp j,215 ;compare la valeur avec le max en verticale
	je bn31
	sub j, 1
	jmp bn30
	bn31:
	mov j,200
	mov m,20
	bn31b:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp m,40 ;compare la valeur avec le max en verticale
	je bn32
	add m, 1
	jmp bn31b
	bn32:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp j,215 ;compare la valeur avec le max en verticale
	je bn33
	add j, 1
	jmp bn32
	bn33:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp m,55 ;compare la valeur avec le max en verticale
	je bn34
	add m, 1
	jmp bn33
	bn34:
	mov j,140
	mov m,20
	bn34b:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp m,40 ;compare la valeur avec le max en verticale
	je bn35
	add m, 1
	jmp bn34b
	bn35:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp j,170 ;compare la valeur avec le max en verticale
	je bn36
	add j, 1
	jmp bn35
	bn36:
	mov j,85
	mov m,135
	bn36b:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp j,100 ;compare la valeur avec le max en verticale
	je bn37
	add j, 1
	jmp bn36b
	bn37:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp m,140 ;compare la valeur avec le max en verticale
	je bn38
	add m, 1
	jmp bn37
	bn38:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp j,115 ;compare la valeur avec le max en verticale
	je bn39
	add j, 1
	jmp bn38
	bn39:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp m,155 ;compare la valeur avec le max en verticale
	je bn40
	add m, 1
	jmp bn39
	bn40:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp j,100 ;compare la valeur avec le max en verticale
	je bn41
	sub j, 1
	jmp bn40
	bn41:
	mov j,200
	mov m,55
	bn41b:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp m,75 ;compare la valeur avec le max en verticale
	je bn42
	add m, 1
	jmp bn41b
	bn42:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp j,220 ;compare la valeur avec le max en verticale
	je bn43
	add j, 1
	jmp bn42
	bn43:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp m,90 ;compare la valeur avec le max en verticale
	je bn44
	add m, 1
	jmp bn43
	bn44:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp j,215 ;compare la valeur avec le max en verticale
	je bn45
	sub j, 1
	jmp bn44
	bn45:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp m,105 ;compare la valeur avec le max en verticale
	je bn46
	add m, 1
	jmp bn45
	bn46:
	mov j,200
	mov m,40
	bn46b:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp j,185 ;compare la valeur avec le max en verticale
	je bn47
	sub j, 1
	jmp bn46b
	bn47:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp m,55 ;compare la valeur avec le max en verticale
	je bn48
	add m, 1
	jmp bn47
	bn48:
	mov j,155
	mov m,30
	bn48b:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp m,40 ;compare la valeur avec le max en verticale
	je bn49
	add m, 1
	jmp bn48b
	bn49:
	mov j,170
	mov m,20
	bn49b:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp m,30 ;compare la valeur avec le max en verticale
	je bn50
	add m, 1
	jmp bn49b
	bn50:
	mov j,215
	mov m,30
	bn50b:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp m,40 ;compare la valeur avec le max en verticale
	je bn51
	add m, 1
	jmp bn50b
	bn51:
	mov j,185
	mov m,70
	bn51b:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp j,205 ;compare la valeur avec le max en verticale
	je bn52
	add j, 1
	jmp bn51b
	bn52:
	mov j,155
	mov m,90
	bn52b:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp j,170 ;compare la valeur avec le max en verticale
	je bn53
	add j, 1
	jmp bn52b
	bn53:
	mov j,205
	bn53b:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp j,215 ;compare la valeur avec le max en verticale
	je bn54
	add j, 1
	jmp bn53b
	bn54:
	mov j,185
	mov m,105
	bn54b:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp j,200 ;compare la valeur avec le max en verticale
	je bn55
	add j, 1
	jmp bn54b
	bn55:
	mov j,145
	mov m,110
	bn55b:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp m,125 ;compare la valeur avec le max en verticale
	je bn56
	add m, 1
	jmp bn55b
	bn56:
	mov j,160
	mov m,125
	bn56b:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp m,140 ;compare la valeur avec le max en verticale
	je bn57
	add m, 1
	jmp bn56b
	bn57:
	mov j,200
	mov m,120
	bn57b:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp j,215 ;compare la valeur avec le max en verticale
	je bn58
	add j, 1
	jmp bn57b
	bn58:
	mov j,130
	mov m,155
	bn58b:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp m,170 ;compare la valeur avec le max en verticale
	je bn59
	add m, 1
	jmp bn58b
	bn59:
	mov j,145
	mov m,140
	bn59b:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp m,155 ;compare la valeur avec le max en verticale
	je bn60
	add m, 1
	jmp bn59b
	bn60:
	mov j,160
	mov m,155
	bn60b:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp m,170 ;compare la valeur avec le max en verticale
	je bn61
	add m, 1
	jmp bn60b
	bn61:
	jmp boucle
	   endm
;---------------------------------------;

;-------------MUR INTERIEUR NIVEAU 2-------------;
murin2 macro
	mov j,200
	mov m,25
	en1:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp j,90 ;compare la valeur avec le max en verticale
	je en2
	sub j, 1
	jmp en1
	en2:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp m,165 ;compare la valeur avec le max en verticale
	je en3
	add m, 1
	jmp en2
	en3:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp j,230 ;compare la valeur avec le max en verticale
	je en4
	add j, 1
	jmp en3
	en4:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp m,25 ;compare la valeur avec le max en verticale
	je en5
	sub m, 1
	jmp en4
	en5:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp j,205 ;compare la valeur avec le max en verticale
	je en6b
	sub j, 1
	jmp en5
	en6b:
	mov j,135
	mov m,160
	en6:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp j,95 ;compare la valeur avec le max en verticale
	je en7
	sub j, 1
	jmp en6
	en7:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp m,30 ;compare la valeur avec le max en verticale
	je en8
	sub m, 1
	jmp en7
	en8:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp j,225 ;compare la valeur avec le max en verticale
	je en9
	add j, 1
	jmp en8
	en9:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp m,160 ;compare la valeur avec le max en verticale
	je en10
	add m, 1
	jmp en9
	en10:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp j,140 ;compare la valeur avec le max en verticale
	je en11b
	sub j, 1
	jmp en10
	en11b:
	mov j,100
	mov m,120
	en11:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp m,155 ;compare la valeur avec le max en verticale
	je en12
	add m, 1
	jmp en11
	en12:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp j,220 ;compare la valeur avec le max en verticale
	je en13
	add j, 1
	jmp en12
	en13:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp m,35 ;compare la valeur avec le max en verticale
	je en14
	sub m, 1
	jmp en13
	en14:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp j,100 ;compare la valeur avec le max en verticale
	je en15
	sub j, 1
	jmp en14
	en15:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp m,115 ;compare la valeur avec le max en verticale
	je en16b
	add m, 1
	jmp en15
	en16b:
	mov j,105
	mov m,105
	en16:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp m,150 ;compare la valeur avec le max en verticale
	je en17
	add m, 1
	jmp en16
	en17:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp j,215 ;compare la valeur avec le max en verticale
	je en18
	add j, 1
	jmp en17
	en18:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp m,40 ;compare la valeur avec le max en verticale
	je en19
	sub m, 1
	jmp en18
	en19:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp j,105 ;compare la valeur avec le max en verticale
	je en20
	sub j, 1
	jmp en19
	en20:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp m,100 ;compare la valeur avec le max en verticale
	je en21b
	add m, 1
	jmp en20
	en21b:
	mov j,210
	mov m,85
	en21:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp m,145 ;compare la valeur avec le max en verticale
	je en22
	add m, 1
	jmp en21
	en22:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp j,110 ;compare la valeur avec le max en verticale
	je en23
	sub j, 1
	jmp en22
	en23:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp m,45 ;compare la valeur avec le max en verticale
	je en24
	sub m, 1
	jmp en23
	en24:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp j,210 ;compare la valeur avec le max en verticale
	je en25
	add j, 1
	jmp en24
	en25:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp m,80 ;compare la valeur avec le max en verticale
	je en26b
	add m, 1
	jmp en25
	en26b:
	mov j,145
	mov m,50
	en26:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp j,115 ;compare la valeur avec le max en verticale
	je en27
	sub j, 1
	jmp en26
	en27:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp m,140 ;compare la valeur avec le max en verticale
	je en28
	add m, 1
	jmp en27
	en28:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp j,205 ;compare la valeur avec le max en verticale
	je en29
	add j, 1
	jmp en28
	en29:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp m,50 ;compare la valeur avec le max en verticale
	je en30
	sub m, 1
	jmp en29
	en30:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp j,150 ;compare la valeur avec le max en verticale
	je en31b
	sub j, 1
	jmp en30
	en31b:
	mov j,140
	mov m,55
	en31:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp j,120 ;compare la valeur avec le max en verticale
	je en32
	sub j, 1
	jmp en31
	en32:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp m,135 ;compare la valeur avec le max en verticale
	je en33
	add m, 1
	jmp en32
	en33:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp j,200 ;compare la valeur avec le max en verticale
	je en34
	add j, 1
	jmp en33
	en34:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp m,55 ;compare la valeur avec le max en verticale
	je en35
	sub m, 1
	jmp en34
	en35:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp j,145 ;compare la valeur avec le max en verticale
	je en36b
	sub j, 1
	jmp en35
	en36b:
	mov j,195
	mov m,125
	en36:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp m,130 ;compare la valeur avec le max en verticale
	je en37
	add m, 1
	jmp en36
	en37:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp j,125 ;compare la valeur avec le max en verticale
	je en38
	sub j, 1
	jmp en37
	en38:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp m,60 ;compare la valeur avec le max en verticale
	je en39
	sub m, 1
	jmp en38
	en39:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp j,195 ;compare la valeur avec le max en verticale
	je en40
	add j, 1
	jmp en39
	en40:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp m,120 ;compare la valeur avec le max en verticale
	je en41b
	add m, 1
	jmp en40
	en41b:
	mov j,160
	mov m,125
	en41:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp j,130 ;compare la valeur avec le max en verticale
	je en42
	sub j, 1
	jmp en41
	en42:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp m,65 ;compare la valeur avec le max en verticale
	je en43
	sub m, 1
	jmp en42
	en43:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp j,190 ;compare la valeur avec le max en verticale
	je en44
	add j, 1
	jmp en43
	en44:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp m,125 ;compare la valeur avec le max en verticale
	je en45
	add m, 1
	jmp en44
	en45:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp j,165 ;compare la valeur avec le max en verticale
	je en46b
	sub j, 1
	jmp en45
	en46b:
	mov j,135
	mov m,100
	en46:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp m,120 ;compare la valeur avec le max en verticale
	je en47
	add m, 1
	jmp en46
	en47:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp j,185 ;compare la valeur avec le max en verticale
	je en48
	add j, 1
	jmp en47
	en48:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp m,70 ;compare la valeur avec le max en verticale
	je en49
	sub m, 1
	jmp en48
	en49:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp j,135 ;compare la valeur avec le max en verticale
	je en50
	sub j, 1
	jmp en49
	en50:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp m,95 ;compare la valeur avec le max en verticale
	je en51b
	add m, 1
	jmp en50
	en51b:
	mov j,165
	mov m,115
	en51:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp j,180 ;compare la valeur avec le max en verticale
	je en52
	add j, 1
	jmp en51
	en52:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp m,75 ;compare la valeur avec le max en verticale
	je en53
	sub m, 1
	jmp en52
	en53:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp j,140 ;compare la valeur avec le max en verticale
	je en54
	sub j, 1
	jmp en53
	en54:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp m,115 ;compare la valeur avec le max en verticale
	je en55
	add m, 1
	jmp en54
	en55:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp j,160 ;compare la valeur avec le max en verticale
	je en56b
	add j, 1
	jmp en55
	en56b:
	mov j,150
	mov m,80
	en56:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp j,145 ;compare la valeur avec le max en verticale
	je en57
	sub j, 1
	jmp en56
	en57:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp m,110 ;compare la valeur avec le max en verticale
	je en58
	add m, 1
	jmp en57
	en58:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp j,175 ;compare la valeur avec le max en verticale
	je en59
	add j, 1
	jmp en58
	en59:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp m,80 ;compare la valeur avec le max en verticale
	je en60
	sub m, 1
	jmp en59
	en60:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp j,155 ;compare la valeur avec le max en verticale
	je en61b
	sub j, 1
	jmp en60
	en61b:
	mov j,170
	mov m,95
	en61:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp m,105 ;compare la valeur avec le max en verticale
	je en62
	add m, 1
	jmp en61
	en62:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp j,150 ;compare la valeur avec le max en verticale
	je en63
	sub j, 1
	jmp en62
	en63:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp m,85 ;compare la valeur avec le max en verticale
	je en64
	sub m, 1
	jmp en63
	en64:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp j,170 ;compare la valeur avec le max en verticale
	je en65
	add j, 1
	jmp en64
	en65:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp m,90 ;compare la valeur avec le max en verticale
	je en66b
	add m, 1
	jmp en65
	en66b:
	mov j,160
	mov m,100
	en66:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp j,165 ;compare la valeur avec le max en verticale
	je en67
	add j, 1
	jmp en66
	en67:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp m,90 ;compare la valeur avec le max en verticale
	je en68
	sub m, 1
	jmp en67
	en68:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp j,155 ;compare la valeur avec le max en verticale
	je en69
	sub j, 1
	jmp en68
	en69:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp m,100 ;compare la valeur avec le max en verticale
	je en70b
	add m, 1
	jmp en69
	en70b:
	mov j,125
	mov m,160
	en70:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp m,155 ;compare la valeur avec le max en verticale
	je en71b
	sub m, 1
	jmp en70
	en71b:
	mov j,230
	mov m,120
	en71:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp j,225 ;compare la valeur avec le max en verticale
	je en72b
	sub j, 1
	jmp en71
	en72b:
	mov j,215
	mov m,65
	en72:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp j,210 ;compare la valeur avec le max en verticale
	je en73b
	sub j, 1
	jmp en72
	en73b:
	mov j,200
	mov m,85
	en73:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp j,195 ;compare la valeur avec le max en verticale
	je en74b
	sub j, 1
	jmp en73
	en74b:
	mov j,180
	mov m,95
	en74:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp j,175 ;compare la valeur avec le max en verticale
	je en75b
	sub j, 1
	jmp en74
	en75b:
	mov j,175
	mov m,125
	en75:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp m,130 ;compare la valeur avec le max en verticale
	je en76b
	add m, 1
	jmp en75
	en76b:
	mov j,155
	mov m,120
	en76:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp m,125 ;compare la valeur avec le max en verticale
	je en77b
	add m, 1
	jmp en76
	en77b:
	mov j,165
	mov m,100
	en77:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp m,105 ;compare la valeur avec le max en verticale
	je en78b
	add m, 1
	jmp en77
	en78b:
	mov j,160
	mov m,80
	en78:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp m,85 ;compare la valeur avec le max en verticale
	je en79b
	add m, 1
	jmp en78
	en79b:
	mov j,165
	mov m,70
	en79:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp m,75 ;compare la valeur avec le max en verticale
	je en80b
	add m, 1
	jmp en79
	en80b:
	mov j,145
	mov m,50
	en80:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp m,55 ;compare la valeur avec le max en verticale
	je en81b
	add m, 1
	jmp en80
	en81b:
	mov j,130
	mov m,45
	en81:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp m,50 ;compare la valeur avec le max en verticale
	je en82b
	add m, 1
	jmp en81
	en82b:
	mov j,100
	mov m,110
	en82:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp j,105 ;compare la valeur avec le max en verticale
	je en83b
	add j, 1
	jmp en82
	en83b:
	mov j,160
	mov m,160
	en83:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 01fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp j,165 ;compare la valeur avec le max en verticale
	je en84b
	add j, 1
	jmp en83
	en84b:
	mov j,160
	mov m,155
	en84:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 01fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp j,165 ;compare la valeur avec le max en verticale
	je en85b
	add j, 1
	jmp en84
	en85b:
	mov j,160
	mov m,150
	en85:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 01fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp j,165 ;compare la valeur avec le max en verticale
	je en86b
	add j, 1
	jmp en85
	en86b:
	mov j,160
	mov m,145
	en86:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 01fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp j,165 ;compare la valeur avec le max en verticale
	je en87b
	add j, 1
	jmp en86
	en87b:
	mov j,160
	mov m,140
	en87:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 01fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp j,165 ;compare la valeur avec le max en verticale
	je en88b
	add j, 1
	jmp en87
	en88b:
	mov j,160
	mov m,135
	en88:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 01fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp j,165 ;compare la valeur avec le max en verticale
	je en89b
	add j, 1
	jmp en88
	en89b:
	mov j,160
	mov m,130
	en89:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 01fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp j,165 ;compare la valeur avec le max en verticale
	je en90b
	add j, 1
	jmp en89
	en90b:
	mov j,160
	mov m,120
	en90:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 01fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp j,165 ;compare la valeur avec le max en verticale
	je en91b
	add j, 1
	jmp en90
	en91b:
	mov j,160
	mov m,110
	en91:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 01fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp j,165 ;compare la valeur avec le max en verticale
	je en92b
	add j, 1
	jmp en91
	en92b:
	mov j,160
	mov m,105
	en92:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 01fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp j,165 ;compare la valeur avec le max en verticale
	je en93b
	add j, 1
	jmp en92
	en93b:
	jmp boucle
	   endm
;---------------------------------------;

;-------------MUR INTERIEUR NIVEAU 3-------------;
murin3 macro
	mov j,85
	mov m,55
	dn1:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp j, 115 ;compare la valeur avec le max en verticale
	je dn2
	add j, 1
	jmp dn1
	dn2:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp m, 65 ;compare la valeur avec le max en verticale
	je dn3
	add m, 1
	jmp dn1
	dn3:
	mov j,130
	mov m,20
	dn3b:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp m, 40 ;compare la valeur avec le max en verticale
	je dn4
	add m, 1
	jmp dn3b
	dn4:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp j, 155 ;compare la valeur avec le max en verticale
	je dn5
	add j, 1
	jmp dn4
	dn5:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp m, 25 ;compare la valeur avec le max en verticale
	je dn6
	sub m, 1
	jmp dn5
	dn6:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp j, 170 ;compare la valeur avec le max en verticale
	je dn7
	add j, 1
	jmp dn6
	dn7:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp m, 40 ;compare la valeur avec le max en verticale
	je dn8
	add m, 1
	jmp dn7
	dn8:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp j, 185 ;compare la valeur avec le max en verticale
	je dn9
	add j, 1
	jmp dn8
	dn9:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp m, 70 ;compare la valeur avec le max en verticale
	je dn10
	add m, 1
	jmp dn9
	dn10:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp j, 175 ;compare la valeur avec le max en verticale
	je dn11
	sub j, 1
	jmp dn10
	dn11:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp m, 85 ;compare la valeur avec le max en verticale
	je dn12
	add m, 1
	jmp dn11
	dn12:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp j, 165 ;compare la valeur avec le max en verticale
	je dn13
	sub j, 1
	jmp dn12
	dn13:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp m, 100 ;compare la valeur avec le max en verticale
	je dn14
	add m, 1
	jmp dn13
	dn14:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp j, 175 ;compare la valeur avec le max en verticale
	je dn15
	add j, 1
	jmp dn14
	dn15:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp m, 110 ;compare la valeur avec le max en verticale
	je dn16
	add m, 1
	jmp dn15
	dn16:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp j, 165 ;compare la valeur avec le max en verticale
	je dn17
	sub j, 1
	jmp dn16
	dn17:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp m, 105 ;compare la valeur avec le max en verticale
	je dn18
	sub m, 1
	jmp dn17
	dn18:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp j, 150 ;compare la valeur avec le max en verticale
	je dn19
	sub j, 1
	jmp dn18
	dn19:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp m, 85 ;compare la valeur avec le max en verticale
	je dn20
	sub m, 1
	jmp dn19
	dn20:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp j, 135 ;compare la valeur avec le max en verticale
	je dn21
	sub j, 1
	jmp dn20
	dn21:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp m, 95 ;compare la valeur avec le max en verticale
	je dn22
	add m, 1
	jmp dn21
	dn22:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp j, 115 ;compare la valeur avec le max en verticale
	je dn23
	sub j, 1
	jmp dn22
	dn23:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp m, 110 ;compare la valeur avec le max en verticale
	je dn24
	add m, 1
	jmp dn23
	dn24:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp j, 100 ;compare la valeur avec le max en verticale
	je dn25
	sub j, 1
	jmp dn24
	dn25:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp m, 125 ;compare la valeur avec le max en verticale
	je dn26
	add m, 1
	jmp dn25
	dn26:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp m, 125 ;compare la valeur avec le max en verticale
	je dn27
	add m, 1
	jmp dn26
	dn27:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp j, 105 ;compare la valeur avec le max en verticale
	je dn28
	add j, 1
	jmp dn27
	dn28:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp m, 140 ;compare la valeur avec le max en verticale
	je dn29
	add m, 1
	jmp dn28
	dn29:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp j, 120 ;compare la valeur avec le max en verticale
	je dn30
	add j, 1
	jmp dn29
	dn30:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp m, 125 ;compare la valeur avec le max en verticale
	je dn31
	sub m, 1
	jmp dn30
	dn31:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp j, 135 ;compare la valeur avec le max en verticale
	je dn32
	add j, 1
	jmp dn31
	dn32:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp m, 140 ;compare la valeur avec le max en verticale
	je dn33
	add m, 1
	jmp dn32
	dn33:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp j, 150 ;compare la valeur avec le max en verticale
	je dn34
	add j, 1
	jmp dn33
	dn34:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp m, 125 ;compare la valeur avec le max en verticale
	je dn35
	sub m, 1
	jmp dn34
	dn35:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp j, 165 ;compare la valeur avec le max en verticale
	je dn36
	add j, 1
	jmp dn35
	dn36:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp m, 150 ;compare la valeur avec le max en verticale
	je dn37
	add m, 1
	jmp dn36
	dn37:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp j, 190 ;compare la valeur avec le max en verticale
	je dn38
	add j, 1
	jmp dn37
	dn38:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp m, 125 ;compare la valeur avec le max en verticale
	je dn39
	sub m, 1
	jmp dn38
	dn39:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp j, 220 ;compare la valeur avec le max en verticale
	je dn40
	add j, 1
	jmp dn39
	dn40:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp m, 140 ;compare la valeur avec le max en verticale
	je dn41
	add m, 1
	jmp dn40
	dn41:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp j, 205 ;compare la valeur avec le max en verticale
	je dn42
	sub j, 1
	jmp dn41
	dn42:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp m, 165 ;compare la valeur avec le max en verticale
	je dn43
	add m, 1
	jmp dn42
	dn43:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp j, 170 ;compare la valeur avec le max en verticale
	je dn44
	sub j, 1
	jmp dn43
	dn44:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 01fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp m, 170 ;compare la valeur avec le max en verticale
	je dn45
	add m, 1
	jmp dn44
	dn45:
	mov j,205
	mov m,20
	dn45b:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp m, 40 ;compare la valeur avec le max en verticale
	je dn46
	add m, 1
	jmp dn45b
	dn46:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp j, 220 ;compare la valeur avec le max en verticale
	je dn47
	add j, 1
	jmp dn46
	dn47:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp m, 55 ;compare la valeur avec le max en verticale
	je dn48
	add m, 1
	jmp dn47
	dn48:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp j, 200 ;compare la valeur avec le max en verticale
	je dn49
	sub j, 1
	jmp dn48
	dn49:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp m, 70 ;compare la valeur avec le max en verticale
	je dn50
	add m, 1
	jmp dn49
	dn50:
	mov j,100
	mov m,35
	dn50b:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp j, 115 ;compare la valeur avec le max en verticale
	je dn51
	add j, 1
	jmp dn50b
	dn51:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp m, 40 ;compare la valeur avec le max en verticale
	je dn52
	add m, 1
	jmp dn51
	dn52:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp j, 100 ;compare la valeur avec le max en verticale
	je dn53
	sub j, 1
	jmp dn52
	dn53:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp m, 35 ;compare la valeur avec le max en verticale
	je dn54
	sub m, 1
	jmp dn53
	dn54:
	mov j,100
	mov m,55
	dn54b:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp m, 80 ;compare la valeur avec le max en verticale
	je dn55
	add m, 1
	jmp dn54b
	dn55:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp j, 115 ;compare la valeur avec le max en verticale
	je dn56
	add j, 1
	jmp dn55
	dn56:
	mov j,130
	mov m,65
	dn56b:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp m, 55 ;compare la valeur avec le max en verticale
	je dn57
	sub m, 1
	jmp dn56b
	dn57:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp j, 140 ;compare la valeur avec le max en verticale
	je dn58
	add j, 1
	jmp dn57
	dn58:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp m, 85 ;compare la valeur avec le max en verticale
	je dn59
	add m, 1
	jmp dn58
	dn59:
	mov j,170
	mov m,40
	dn59b:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp m, 55 ;compare la valeur avec le max en verticale
	je dn60
	add m, 1
	jmp dn59b
	dn60:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp j, 155 ;compare la valeur avec le max en verticale
	je dn61
	sub j, 1
	jmp dn60
	dn61:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp m, 70 ;compare la valeur avec le max en verticale
	je dn62
	add m, 1
	jmp dn61
	dn62:
	mov j,175
	mov m,85
	dn62b:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp j, 200 ;compare la valeur avec le max en verticale
	je dn63
	add j, 1
	jmp dn62b
	dn63:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp m, 110 ;compare la valeur avec le max en verticale
	je dn64
	add m, 1
	jmp dn63
	dn64:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp j, 190 ;compare la valeur avec le max en verticale
	je dn65
	sub j, 1
	jmp dn64
	dn65:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp m, 85 ;compare la valeur avec le max en verticale
	je dn66
	sub m, 1
	jmp dn65
	dn66:
	mov j,220
	mov m,55
	dn66b:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp m, 70 ;compare la valeur avec le max en verticale
	je dn67
	add m, 1
	jmp dn66b
	dn67:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp j, 215 ;compare la valeur avec le max en verticale
	je dn68
	sub j, 1
	jmp dn67
	dn68:
	mov j,215
	mov m,85
	dn68b:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp m, 100 ;compare la valeur avec le max en verticale
	je dn69
	add m, 1
	jmp dn68b
	dn69:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp j, 235 ;compare la valeur avec le max en verticale
	je dn70
	add j, 1
	jmp dn69
	dn70:
	mov j,85
	mov m,155
	dn70b:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 01fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp j, 100 ;compare la valeur avec le max en verticale
	je dn71
	add j, 1
	jmp dn70b
	dn71:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp m, 140 ;compare la valeur avec le max en verticale
	je dn72
	sub m, 1
	jmp dn71
	dn72:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp j, 105 ;compare la valeur avec le max en verticale
	je dn73
	add j, 1
	jmp dn72
	dn73:
	mov j,120
	mov m,140
	dn73b:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp m, 155 ;compare la valeur avec le max en verticale
	je dn74
	add m, 1
	jmp dn73b
	dn74:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp j, 135 ;compare la valeur avec le max en verticale
	je dn75
	add j, 1
	jmp dn74
	dn75:
	mov j,170
	mov m,20
	dn75b:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp m, 25 ;compare la valeur avec le max en verticale
	je dn76
	add m, 1
	jmp dn75b
	dn76:
	mov j,135
	mov m,95
	dn76b:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp m, 110 ;compare la valeur avec le max en verticale
	je dn77
	add m, 1
	jmp dn76b
	dn77:
	mov j,165
	mov m,100
	dn77b:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp m,105  ;compare la valeur avec le max en verticale
	je dn78
	add m, 1
	jmp dn77b
	dn78:
	mov j,215
	mov m,100
	dn78b:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp m,110  ;compare la valeur avec le max en verticale
	je dn79
	add m, 1
	jmp dn78b
	dn79:
	mov j,110
	mov m,155
	dn79b:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp m,170  ;compare la valeur avec le max en verticale
	je dn80
	add m, 1
	jmp dn79b
	dn80:
	mov j,150
	mov m,155
	dn80b:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp m,170  ;compare la valeur avec le max en verticale
	je dn81
	add m, 1
	jmp dn80b
	dn81:
	mov j,165
	mov m,125
	dn81b:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp j,175  ;compare la valeur avec le max en verticale
	je dn82
	add j, 1
	jmp dn81b
	dn82:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp m,135  ;compare la valeur avec le max en verticale
	je dn83
	add m, 1
	jmp dn82
	dn83:
	mov j,100
	mov m,95
	dn83b:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, j	; colonne pixel 
	mov dx, m	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp j,115  ;compare la valeur avec le max en verticale
	je dn84
	add j, 1
	jmp dn83b
	dn84:
	jmp boucle
	   endm
;---------------------------------------;

;------------PERSONNAGE------------;
perso 	macro  ver,hor,ver11, hor11, ver12, hor12, ver21, hor21, ver22, hor22
;code antibug;
	mov cx, ver	; colonne pixel 
	mov dx, hor	; ligne pixel 
;position 11;
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, ver11	; colonne pixel 
	mov dx, hor11	; ligne pixel 
	mov al, 4fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
;position 12;
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, ver12	; colonne pixel 
	mov dx, hor12	; ligne pixel 
	mov al, 4fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
;position 21;
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, ver21	; colonne pixel 
	mov dx, hor21	; ligne pixel 
	mov al, 4fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
;position 22;
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, ver22	; colonne pixel 
	mov dx, hor22	; ligne pixel 
	mov al, 4fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
		endm
;---------------------------------------;

;--------------SORTIE NIVEAU 1-------------;
sn1 macro
	;sortie n1
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, 120	; colonne pixel 
	mov dx, 40	; ligne pixel 
	mov al, 4h	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, 121	; colonne pixel 
	mov dx, 41	; ligne pixel 
	mov al, 4h	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, 120	; colonne pixel 
	mov dx, 41	; ligne pixel 
	mov al, 4h	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, 121	; colonne pixel 
	mov dx, 40	; ligne pixel 
	mov al, 4h	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	  endm
;------------------------------------------;
;--------------SORTIE NIVEAU 2-------------;
sn2 macro
	;sortie n2
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, 159	; colonne pixel 
	mov dx, 94	; ligne pixel 
	mov al, 4h	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, 159	; colonne pixel 
	mov dx, 95	; ligne pixel 
	mov al, 4h	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, 160	; colonne pixel 
	mov dx, 94	; ligne pixel 
	mov al, 4h	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, 160	; colonne pixel 
	mov dx, 95	; ligne pixel 
	mov al, 4h	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	  endm
;--------------SORTIE NIVEAU 3-------------;
sn3 macro
	;sortie n3
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, 120	; colonne pixel 
	mov dx, 40	; ligne pixel 
	mov al, 4h	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, 121	; colonne pixel 
	mov dx, 41	; ligne pixel 
	mov al, 4h	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, 120	; colonne pixel 
	mov dx, 41	; ligne pixel 
	mov al, 4h	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, 121	; colonne pixel 
	mov dx, 40	; ligne pixel 
	mov al, 4h	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	  endm

;-----------CMP MUR HAUT---------------;
cmpmurh	macro ver11, hor11, ver21, hor21
	mov ah, 0dh	; fonction afficher pixel 
	mov cx, ver11	; colonne pixel
	sub hor11,1 
	mov dx, hor11	; ligne pixel 
	mov bh, 0h	; page ecran 
	int 10h
	add hor11,1
	cmp al, 15
	je boucle
	cmp al, 4
	je gagne
	mov ah, 0dh	; fonction afficher pixel 
	mov cx, ver21	; colonne pixel
	sub hor21,1 
	mov dx, hor21	; ligne pixel 
	mov bh, 0h	; page ecran 
	int 10h
	add hor21,1
	cmp al, 15
	je boucle
	cmp al, 4
	je gagne
		endm
;---------------------------------------;

;-----------CMP MUR BAS---------------;
cmpmurb	macro ver12, hor12, ver22, hor22
	mov ah, 0dh	; fonction afficher pixel 
	mov cx, ver12	; colonne pixel
	add hor12,1 
	mov dx, hor12	; ligne pixel 
	mov bh, 0h	; page ecran 
	int 10h
	sub hor12,1
	cmp al, 15
	je boucle
	cmp al, 4
	je gagne
	mov ah, 0dh	; fonction afficher pixel 
	mov cx, ver22	; colonne pixel
	add hor22,1 
	mov dx, hor22	; ligne pixel 
	mov bh, 0h	; page ecran 
	int 10h
	sub hor22,1
	cmp al, 15
	je boucle
	cmp al, 4
	je gagne
		endm
;---------------------------------------;

;-----------CMP MUR DROIT---------------;
cmpmurd	macro ver21, hor21, ver22, hor22
	mov ah, 0dh	; fonction afficher pixel
	add ver21,1  
	mov cx, ver21	; colonne pixel
	mov dx, hor21	; ligne pixel 
	mov bh, 0h	; page ecran 
	int 10h
	sub ver21,1
	cmp al, 15
	je boucle
	cmp al, 4
	je gagne
	mov ah, 0dh	; fonction afficher pixel 
	add ver22,1 
	mov cx, ver22	; colonne pixel
	mov dx, hor22	; ligne pixel 
	mov bh, 0h	; page ecran 
	int 10h
	sub ver22,1
	cmp al, 15
	je boucle
	cmp al, 4
	je gagne
		endm
;---------------------------------------;

;-----------CMP MUR GAUCHE---------------;
cmpmurg	macro ver11, hor11, ver12, hor12
	mov ah, 0dh	; fonction afficher pixel
	sub ver11,1  
	mov cx, ver11	; colonne pixel
	mov dx, hor11	; ligne pixel 
	mov bh, 0h	; page ecran 
	int 10h
	add ver11,1
	cmp al, 15
	je boucle
	cmp al, 4
	je gagne
	mov ah, 0dh	; fonction afficher pixel 
	sub ver12,1 
	mov cx, ver12	; colonne pixel
	mov dx, hor12	; ligne pixel 
	mov bh, 0h	; page ecran 
	int 10h
	add ver12,1
	cmp al, 15
	je boucle
	cmp al, 4
	je gagne
		endm
;---------------------------------------;

;-----------MUR HAUT---------------;
mhaut   macro vvert, vhort
	bha:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, vvert	; colonne pixel 
	mov dx, vhort	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp vhort, 170 ;compare la valeur avec le max en verticale
	je down
	add vhort, 1
	jmp bha
		endm
;---------------------------------------;

;------------MACRO ANTI BUG---------------;
mab   macro vvert, vhort
	nop
		endm
;---------------------------------------;

;-----------MUR BAS---------------;	
mbas    macro vvert, vhort
	bb:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, vvert	; colonne pixel 
	mov dx, vhort	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp vhort, 170 ;compare la valeur avec le max en verticale
	je right
	add vhort, 1
	jmp bb
        endm
;---------------------------------------;

;-----------MUR DROIT---------------;
mdroite macro vvert, vhort
	bd:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, vvert	; colonne pixel 
	mov dx, vhort	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp vvert, 235 ;compare la valeur avec le max en horizontale
	je left
	add vvert,1
	jmp bd
        endm
;---------------------------------------;

;-----------MUR GAUCHE---------------;
mgauche macro vvert, vhort

	bg:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, vvert	; colonne pixel 
	mov dx, vhort	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp vvert, 235 ;compare la valeur avec le max en horizontale
	je antibug
	add vvert,1
	jmp bg
		endm
mhaut2   macro vvert, vhort
	eha:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, vvert	; colonne pixel 
	mov dx, vhort	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp vhort, 170 ;compare la valeur avec le max en verticale
	je down2
	add vhort, 1
	jmp eha
		endm
;---------------------------------------;

;-----------MUR BAS 2---------------;	
mbas2    macro vvert, vhort
	eb:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, vvert	; colonne pixel 
	mov dx, vhort	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp vhort, 170 ;compare la valeur avec le max en verticale
	je right2
	add vhort, 1
	jmp eb
        endm
;---------------------------------------;

;-----------MUR DROIT 2---------------;
mdroite2 macro vvert, vhort
	ed:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, vvert	; colonne pixel 
	mov dx, vhort	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp vvert, 235 ;compare la valeur avec le max en horizontale
	je left2
	add vvert,1
	jmp ed
        endm
;---------------------------------------;

;-----------MUR GAUCHE 2---------------;
mgauche2 macro vvert, vhort
	eg:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, vvert	; colonne pixel 
	mov dx, vhort	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp vvert, 235 ;compare la valeur avec le max en horizontale
	je antibug2
	add vvert,1
	jmp eg
		endm	
;---------------------------------------;
;-------------------------------MUR NIVEAU 3-----------------------------------------;

;------------------------------------------------------------------------------------;	
;---------------------------------------;
;-----------MUR HAUT---------------;
mhaut3   macro vvert, vhort
	cha:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, vvert	; colonne pixel 
	mov dx, vhort	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp vhort, 170 ;compare la valeur avec le max en verticale
	je down3
	add vhort, 1
	jmp cha
		endm
;---------------------------------------;

;-----------MUR BAS---------------;	
mbas3    macro vvert, vhort
	cb:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, vvert	; colonne pixel 
	mov dx, vhort	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp vhort, 170 ;compare la valeur avec le max en verticale
	je right3
	add vhort, 1
	jmp cb
        endm
;---------------------------------------;

;-----------MUR DROIT---------------;
mdroite3 macro vvert, vhort
	cd:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, vvert	; colonne pixel 
	mov dx, vhort	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp vvert, 235 ;compare la valeur avec le max en horizontale
	je left3
	add vvert,1
	jmp cd
        endm
;---------------------------------------;

;-----------MUR GAUCHE---------------;
mgauche3 macro vvert, vhort
	cg:
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, vvert	; colonne pixel 
	mov dx, vhort	; ligne pixel 
	mov al, 00fh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	cmp vvert, 235 ;compare la valeur avec le max en horizontale
	je antibug3
	add vvert,1
	jmp cg
		endm	
;---------------------------------------;

;-----------------------------------------------FIN ESPACE MACRO---------------------------------------------;		
menu:
mov ah, 0h	; mode video 320*200 256 couleurs 
mov al, 13h 
int 10h
	mov  dx, offset menujeu
  	mov  ah, 9
  	int  21h
  	mov  dx, offset jouer
  	mov  ah, 9
  	int  21h
  	mov  dx, offset quitter
  	mov  ah, 9
  	int  21h
  	mov ah,8
	int 21h
	cmp al,49
	je mjouer
	cmp al,50
	je fin
	cmp al,27	;compare le code ascii de la touche avec le code ascii de la touche echap
	je fin	
	jne menu 
mjouer:
efecran
	mov ah,2
	mov dh,0
	mov dl,0
	mov bh,0
	int 10h
	mov  dx, offset menuniveau
  	mov  ah, 9
  	int  21h
  	mov ah,8
	int 21h
	cmp al,49
	je n1
	cmp al,50
	je n2
	cmp al,51
	je n3
	cmp al,27	;compare le code ascii de la touche avec le code ascii de la touche echap
	je menu	
	jne mjouer
	efecran
;------------------------------------------NIVEAU 1----------------------------------;

;----------------------------------------------------------------------------------------------;
n1:
	;-----------affichage perso----------------;
	efecran
	mov ah,2dh
	mov ch,0
	mov cl,0
	mov dh,0
	mov dl,0
	int 21h
	
	mov ah,2ch
	int 21h
	mov bl,dh
	add bl,30
	cmp bl,60
	ja s1
	jmp n1b
	s1:
	sub bl,60
	n1b:
	mov ah,2
	mov dh,1
	mov dl,0
	mov bh,0
	int 10h
	mov  dx, offset niveau1
  	mov  ah, 9
  	int  21h
	mov ver11,196
	mov hor11,146
	mov ver12,196
	mov hor12,147
	mov ver21,197
	mov hor21,146
	mov ver22,197
	mov hor22,147
	perso  ver ,hor ,ver11, hor11, ver12, hor12, ver21, hor21, ver22, hor22 
	sn1
	;-----------------------------------------;
	
	;-----------------affichage contour------------------;
	
	vvert dw 85
	vhort dw 20
	mhaut  vvert, vhort
	down: 
	mov vvert,235
	mov vhort,20
	mbas  vvert, vhort
	right: 
	mov vvert,85
	mdroite  vvert, vhort
	left: 
	mov vvert,85
	mov vhort,20
	mgauche  vvert, vhort
	antibug:
	mov vvert,85
	mov vhort,20
	mab vvert, vhort
	murin1
n2:
	;-----------affichage perso----------------;
	efecran
	mov ah,2dh
	mov ch,0
	mov cl,0
	mov dh,0
	mov dl,0
	int 21h
	
	mov ah,2ch
	int 21h
	mov bl,dh
	add bl,59
	cmp bl, 60
	ja s2
	jmp n2b
	s2:
	sub bl,60
	n2b:
	mov ah,2
	mov dh,1
	mov dl,0
	mov bh,0
	int 10h
	mov  dx, offset niveau2
  	mov  ah, 9
  	int  21h
	mov ver11,227
	mov hor11,162
	mov ver12,227
	mov hor12,163
	mov ver21,228
	mov hor21,162
	mov ver22,228
	mov hor22,163
	perso  ver ,hor ,ver11, hor11, ver12, hor12, ver21, hor21, ver22, hor22 
	sn2
	;-----------------------------------------;
	
	;-----------------affichage contour------------------;
	
	mov vvert, 85
	mov vhort, 20
	mhaut2  vvert, vhort
	down2: 
	mov vvert,235
	mov vhort,20
	mbas2  vvert, vhort
	right2: 
	mov vvert,85
	mdroite2  vvert, vhort
	left2: 
	mov vvert,85
	mov vhort,20
	mgauche2  vvert, vhort
	antibug2:
	mov vvert,85
	mov vhort,20
	mab vvert, vhort
	murin2
;------------------------------------------NIVEAU 3----------------------------------;

;----------------------------------------------------------------------------------------------;
n3:
	efecran
	mov ah,2dh
	mov ch,0
	mov cl,0
	mov dh,0
	mov dl,0
	int 21h
	
	mov ah,2ch
	int 21h
	mov bl,dh
	add bl,59
	cmp bl,60
	ja s3
	jmp n3b
	s3:
	sub bl,60
	n3b:
	mov ah,2
	mov dh,1
	mov dl,0
	mov bh,0
	int 10h
	mov  dx, offset niveau3
  	mov  ah, 9
  	int  21h
	mov ver11,180
	mov hor11,111
	mov ver12,180
	mov hor12,112
	mov ver21,181
	mov hor21,111
	mov ver22,181
	mov hor22,112
	perso  ver ,hor ,ver11, hor11, ver12, hor12, ver21, hor21, ver22, hor22
	sn3
	mov vvert, 85
	mov vhort, 20
	mhaut3  vvert, vhort
	down3: 
	mov vvert,235
	mov vhort,20
	mbas3  vvert, vhort
	right3: 
	mov vvert,85
	mdroite3  vvert, vhort
	left3: 
	mov vvert,85
	mov vhort,20
	mgauche3  vvert, vhort
	antibug3:
	mov vvert,85
	mov vhort,20
	mab vvert, vhort
	murin3
	;------------------------------------------------;
	
	;------------lecture touche--------------;
	boucle:
	mtimer bl
	mov ah,06
	mov dl,0ffh
	int 21h
	jz boucle
	mov ah,8
	int 21h
	cmp al,27	;compare le code ascii de la touche avec le code ascii de la touche echap
	je mjouer		;si touche echap alors stop programme
 	cmp al, 80 ;compare le code ascii de la touche avec le code ascii de la touche down
 	je bas		;si touche s alors go bas
 	cmp al, 72	;compare le code ascii de la touche avec le code ascii de la touche up
 	je haut		;si touche z alors go haut
 	cmp al,75	;compare le code ascii de la touche avec le code ascii de la touche left
 	je gauche	;si touche q alors go gauche
 	cmp al,77	;compare le code ascii de la touche avec le code ascii de la touche right
 	je droite	;si touche d alors go droite
 	jne boucle	;sinon recommence
 	
	;-----------------------------------------;
	
	;----------effacer premier pixel----------;
	bas:
	cmpmurb	ver12, hor12, ver22, hor22
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, ver11	; colonne pixel 
	mov dx, hor11	; ligne pixel 
	mov al, 0ffh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, ver21	; colonne pixel 
	mov dx, hor21	; ligne pixel 
	mov al, 0ffh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	;-------------------------------------------;
	
	;-----------apparait pixel bas--------------;
	add hor11,1
	add hor12,1
	add hor21,1
	add hor22,1
	perso  ver ,hor ,ver11, hor11, ver12, hor12, ver21, hor21, ver22, hor22
	jmp boucle 
	;-------------------------------------------;
	
	;----------effacer premier pixel----------;
	haut:
	cmpmurh  ver11,hor11, ver21, hor21
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, ver12	; colonne pixel 
	mov dx, hor12	; ligne pixel 
	mov al, 0ffh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, ver22	; colonne pixel 
	mov dx, hor22	; ligne pixel 
	mov al, 0ffh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	;-------------------------------------------;
	
	;-----------apparait pixel haut--------------;
	
	sub hor11,1
	sub hor12,1
	sub hor21,1
	sub hor22,1
	perso  ver ,hor ,ver11, hor11, ver12, hor12, ver21, hor21, ver22, hor22
	jmp boucle 
	;-------------------------------------------;
	
	;----------effacer premier pixel----------;
	gauche:
	cmpmurg	ver11, hor11, ver12, hor12
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, ver21	; colonne pixel 
	mov dx, hor21	; ligne pixel 
	mov al, 0ffh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, ver22	; colonne pixel 
	mov dx, hor22	; ligne pixel 
	mov al, 0ffh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	;-------------------------------------------;
	
	;-----------apparait pixel gauche--------------;
	sub ver11,1
	sub ver12,1
	sub ver21,1
	sub ver22,1
	perso  ver ,hor ,ver11, hor11, ver12, hor12, ver21, hor21, ver22, hor22
	jmp boucle 
	;-------------------------------------------;
	
	;----------effacer premier pixel----------;
	droite:
	cmpmurd	ver21, hor21, ver22, hor22
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, ver11	; colonne pixel 
	mov dx, hor11	; ligne pixel 
	mov al, 0ffh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	mov ah, 0ch	; fonction afficher pixel 
	mov cx, ver12	; colonne pixel 
	mov dx, hor12	; ligne pixel 
	mov al, 0ffh	; couleur pixel 
	mov bh, 0h	; page ecran 
	int 10h ; affichage du resultat
	;-------------------------------------------;
	
	;-----------apparait pixel droite--------------;
	add ver11,1
	add ver12,1
	add ver21,1
	add ver22,1
	perso  ver ,hor ,ver11, hor11, ver12, hor12, ver21, hor21, ver22, hor22
	jmp boucle 
	;-------------------------------------------;
gagne:
	efecran
	mov ah,2
	mov dh,0
	mov dl,0
	mov bh,0
	int 10h
	mov  dx, offset gagnem+2
  	mov  ah, 9
  	int  21h
	mov ah,8
	int 21h
	cmp al,13
	je mjouer
	cmp al,27
	je menu
	jne gagne
	efecran
perdu:
	efecran
	mov ah,2
	mov dh,0
	mov dl,0
	mov bh,0
	int 10h
	mov  dx, offset perdum
  	mov  ah, 9
  	int  21h
  	mov ah,8
	int 21h
	cmp al,13
	je mjouer
	cmp al,27
	je menu
	jne perdu
	efecran
fin:
	efecran
	jmp vfin
	vfin:
        ; exit to DOS
        mov ah,2
		mov dh,0
		mov dl,0
		mov bh,0
		int 10h
        mov     ax, 4C00h
       	int     21h

cseg    ends
end start
