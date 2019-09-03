#Autor: Juan Gabriel Bustos Armenta
import Tkinter as tk
import tkFileDialog
import Pmw, sys, os

def buscar_tp():
    file = tkFileDialog.askopenfile(parent=root,mode='rb',title='Choose a file')
    if file != None:
        data = file.read()
        file.close()
        print "I got %d bytes from this file." % len(data)
	#print (file.name)

	file_dir=file.name
        current_dir=os.getcwd()
	print (file_dir)
	print (current_dir)
	os.system("cp " + file_dir +" " + "/home/graph_dump/created//traffic")
def tp():

    os.system("sh dump_graph.sh")

def buscar_delay():
    file = tkFileDialog.askopenfile(parent=root,mode='rb',title='Choose a file')
    if file != None:
        data = file.read()
	#name = file.name()
        file.close()
        print "I got %d bytes from this file." % len(data)
	#print (file.name)

	file_dir=file.name
        current_dir=os.getcwd()
	print (file_dir)
	print (current_dir)
	os.system("cp " + file_dir +" " + "/home/graph_dump/created/delay.txt")
def delay():
    os.system("sh dump_delay.sh")


def estadisticas():

    os.system("sh dump.sh")
    os.system("perl statistics.pl /home/graph_dump/created/traf_3 1 > /home/graph_dump/created/statistics.txt")
    os.system("xdg-open /home/graph_dump/created/statistics.txt")


def salir():
    root.destroy()

root = tk.Tk()

root.title("GraphDump")

text = tk.Label(root, text="Analizador de trafico")
text.config(font=("Arial", 20))
text.pack(padx=20,pady=10)

boton_buscar_tp=tk.Button(root, text='Abrir archivo de trafico tcpdump', command=buscar_tp)
boton_buscar_tp.place(x=5,y=20)
boton_buscar_tp.pack(pady=5)

boton_buscar_delay=tk.Button(root, text='Abrir archivo de retardo tcpdump', command=buscar_delay)
boton_buscar_delay.place(x=5,y=20)
boton_buscar_delay.pack(pady=5)

boton_tp=tk.Button(root, text='Graficar throughput', command=tp)
boton_tp.place(x=5,y=40)
boton_tp.pack(pady=5)

boton_delay=tk.Button(root, text='Graficar retardo', command=delay)
boton_delay.place(x=5,y=40)
boton_delay.pack(pady=5)

boton_estadisticas = tk.Button(root, text="Ver estadisticas", command=estadisticas)
boton_estadisticas.place(x=5, y=60)
boton_estadisticas.pack(pady=5)

boton_salir = tk.Button(root, text="Salir",command=salir) #command=funcion, cuando se presione el boton, se ejecutara la funcion "suma"
boton_salir.place(x=5,y=80)
boton_salir.pack(pady=5)

text2 = tk.Label(root, text="Desarrollado por: Juan Gabriel Bustos y Fran Sanabria")
text2.config(font=("Arial", 8))
text2.pack(padx=20,pady=10)

text3 = tk.Label(root, text="Facultad de Ingenieria \nPrograma de Ingenieria Electronica \nUniversidad de San Buenaventura, sede Bogota")
text3.config(font=("Arial", 8))
text3.pack(padx=20,pady=10)

root.mainloop()
