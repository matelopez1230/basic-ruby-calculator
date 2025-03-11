def obtenerNumeros(arrayTrabajo)
  # Método para tomar múltiples números enteros como entrada del usuario.
  puts "Por favor, ingresá los números que querés usar. Escribí 'listo' cuando termines."
  siguienteNum = 0
  # Crea la variable siguienteNum.
  while siguienteNum != "listo"
    siguienteNum = gets.chomp!
    if siguienteNum == "listo"
      puts "¡Calculando!"
    elsif siguienteNum != "0" && siguienteNum.to_i == 0
      # Verifica si hay caracteres no numéricos.
      puts "Eso no es un número."
      siguienteNum = "listo"
      # Sale del bucle si se ingresa un carácter no numérico.
    else
      arrayTrabajo << siguienteNum.to_i
      # Almacena cada entrada en arrayTrabajo.
    end
  end
end

def sumar(arrayTrabajo)
  suma = 0
  arrayTrabajo.each { |num| suma += num }
  puts "La suma es #{suma}"
end

def restar(arrayTrabajo)
  diferencia = arrayTrabajo.shift # Toma el primer número como base
  arrayTrabajo.each { |num| diferencia -= num }
  puts "La diferencia es #{diferencia}"
end

def multiplicar(arrayTrabajo)
  producto = 1
  arrayTrabajo.each { |num| producto *= num }
  puts "El producto es #{producto}"
end

def dividir(arrayTrabajo)
  cociente = arrayTrabajo.shift.to_f # Usa el primer número como base
  arrayTrabajo.each { |num| cociente /= num.to_f }
  puts "El cociente es #{cociente}"
end

# Inicio del programa.
puts "Bienvenido a la calculadora."
puts "¿Querés hacer un cálculo? (s/n)"
inicio = gets.chomp!.downcase

if inicio == "n"
  puts "Qué lástima. ¡Chau!"
end
if inicio != "n" && inicio != "s"
  puts "No entiendo. Apagando."
end

while inicio == "s"
  arrayTrabajo = []
  puts "¿Qué operación querés hacer?"
  puts "Opciones: Sumar, Restar, Multiplicar, Dividir, Potencia, Raíz Cuadrada"
  puts "Ingresá tu elección:"
  eleccion = gets.chomp!.downcase

  case eleccion
  when "potencia"
    puts "Ingresá el número base:"
    base = gets.chomp!
    if base != "0" && base.to_i == 0
      puts "Eso no es un número."
    else
      base = base.to_i
      puts "Ingresá el exponente:"
      exponente = gets.chomp!
      if exponente != "0" && exponente.to_i == 0
        puts "Eso no es un número."
      else
        exponente = exponente.to_i
        resultado = base ** exponente
        puts "El resultado de la potencia es #{resultado}"
      end
    end
  when "raíz cuadrada"
    puts "Ingresá el número al que querés calcularle la raíz cuadrada:"
    numero = gets.chomp!
    if numero != "0" && numero.to_i == 0
      puts "Eso no es un número."
    else
      numero = numero.to_i
      raiz = numero ** 0.5
      puts "La raíz cuadrada es #{raiz}"
    end
  when "sumar"
    obtenerNumeros(arrayTrabajo)
    sumar(arrayTrabajo)
  when "restar"
    obtenerNumeros(arrayTrabajo)
    restar(arrayTrabajo)
  when "multiplicar"
    obtenerNumeros(arrayTrabajo)
    multiplicar(arrayTrabajo)
  when "dividir"
    obtenerNumeros(arrayTrabajo)
    dividir(arrayTrabajo)
  else
    puts "Esa no es una opción válida."
  end
  
  puts "¿Querés hacer otro cálculo? (s/n)"
  inicio = gets.chomp.downcase
  if inicio == "n"
    puts "¡Chau!"
  elsif inicio != "n" && inicio != "s"
    puts "No entiendo. Apagando."
  end
end
