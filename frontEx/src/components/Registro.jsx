import { useState } from "react";
import { Eye, EyeOff, User, Mail, Lock, UserPlus } from "lucide-react";
import { Link } from "react-router-dom";
import createUsuarioService from "../services/createUsuarioService";
import SwAlertaComp from "../services/SwAlertaComp";
import sendEmail from "../services/envioEmailService";
import { mensajeRegistro } from "../mocks/emailText/textEmail";

const Registro = () => {
  const [formData, setFormData] = useState({
    nombre: "",
    apellido: "",
    email: "",
    contraseña: "",
    confirmacionContraseña: "",
    rol: "bronce",
  });

  const [showPassword, setShowPassword] = useState(false);
  const [showConfirmPassword, setShowConfirmPassword] = useState(false);
  const [errors, setErrors] = useState({});

  const handleChange = (e) => {
    const { name, value } = e.target;
    setFormData((prev) => ({
      ...prev,
      [name]: value,
    }));

    // Limpiar error cuando el usuario empiece a escribir
    if (errors[name]) {
      setErrors((prev) => ({
        ...prev,
        [name]: "",
      }));
    }
  };

  const validateForm = () => {
    const newErrors = {};

    // Validar nombre
    if (!formData.nombre.trim()) {
      newErrors.nombre = "El nombre es requerido";
    }

    // Validar apellido
    if (!formData.apellido.trim()) {
      newErrors.apellido = "El apellido es requerido";
    }

    // Validar email
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!formData.email.trim()) {
      newErrors.email = "El email es requerido";
    } else if (!emailRegex.test(formData.email)) {
      newErrors.email = "El formato del email no es válido";
    }

    // Validar contraseña
    if (!formData.contraseña) {
      newErrors.contraseña = "La contraseña es requerida";
    } else if (formData.contraseña.length < 6) {
      newErrors.contraseña = "La contraseña debe tener al menos 6 caracteres";
    }

    // Validar confirmación de contraseña
    if (!formData.confirmacionContraseña) {
      newErrors.confirmacionContraseña = "Debe confirmar la contraseña";
    } else if (formData.contraseña !== formData.confirmacionContraseña) {
      newErrors.confirmacionContraseña = "Las contraseñas no coinciden";
    }

    setErrors(newErrors);
    return Object.keys(newErrors).length === 0;
  };

  const handleSubmit = async () => {
    if (validateForm()) {
      try {
        console.log("Datos del formulario:", formData);
        const res = await createUsuarioService({
          nombre: formData.nombre,
          apellido: formData.apellido,
          email: formData.email,
          contrasena: formData.contraseña,
          rol: formData.rol,
        });
        if (res.status === 201) {
          SwAlertaComp("Éxito!", res.message, "success");
          const emailData = {
            to: formData.email,
            subject:
              "🎉 ¡Bienvenido/a a VitalCrossfit - Tu Entrenamiento, Nuestra Pasión!",
            text: mensajeRegistro(formData.nombre),
          };
          sendEmail(emailData)
            .then((response) => console.log("Email enviado:", response))
            .catch((error) => console.error("Error:", error));
        }
      } catch (err) {
        SwAlertaComp("Error!", err.message, "error");
      }
    }
  };

  return (
    <div className="max-w-2xl mx-auto bg-white rounded-xl shadow-lg p-8">
      {/* Header */}
      <div className="text-center mb-8">
        <div className="bg-cyan-100 w-16 h-16 rounded-full flex items-center justify-center mx-auto mb-4">
          <UserPlus className="w-8 h-8 text-cyan-600" />
        </div>
        <h2 className="text-2xl font-bold text-gray-800">
          Registro de Cliente
        </h2>
        <p className="text-gray-600 mt-2">Crea tu cuenta para comenzar</p>
      </div>

      {/* Formulario */}
      <div className="space-y-6">
        {/* Nombre */}
        <div>
          <label
            htmlFor="nombre"
            className="block text-sm font-medium text-gray-700 mb-2"
          >
            Nombre
          </label>
          <div className="relative">
            <div className="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
              <User className="h-5 w-5 text-gray-400" />
            </div>
            <input
              type="text"
              id="nombre"
              name="nombre"
              value={formData.nombre}
              onChange={handleChange}
              className={`w-full pl-10 pr-3 py-3 border rounded-lg focus:outline-none focus:ring-2 focus:ring-cyan-500 focus:border-transparent ${
                errors.nombre ? "border-red-500" : "border-gray-300"
              }`}
              placeholder="Ingresa tu nombre"
            />
          </div>
          {errors.nombre && (
            <p className="mt-1 text-sm text-red-600">{errors.nombre}</p>
          )}
        </div>

        {/* Apellido */}
        <div>
          <label
            htmlFor="apellido"
            className="block text-sm font-medium text-gray-700 mb-2"
          >
            Apellido
          </label>
          <div className="relative">
            <div className="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
              <User className="h-5 w-5 text-gray-400" />
            </div>
            <input
              type="text"
              id="apellido"
              name="apellido"
              value={formData.apellido}
              onChange={handleChange}
              className={`w-full pl-10 pr-3 py-3 border rounded-lg focus:outline-none focus:ring-2 focus:ring-cyan-500 focus:border-transparent ${
                errors.apellido ? "border-red-500" : "border-gray-300"
              }`}
              placeholder="Ingresa tu apellido"
            />
          </div>
          {errors.apellido && (
            <p className="mt-1 text-sm text-red-600">{errors.apellido}</p>
          )}
        </div>

        {/* Email */}
        <div>
          <label
            htmlFor="email"
            className="block text-sm font-medium text-gray-700 mb-2"
          >
            Email
          </label>
          <div className="relative">
            <div className="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
              <Mail className="h-5 w-5 text-gray-400" />
            </div>
            <input
              type="email"
              id="email"
              name="email"
              value={formData.email}
              onChange={handleChange}
              className={`w-full pl-10 pr-3 py-3 border rounded-lg focus:outline-none focus:ring-2 focus:ring-cyan-500 focus:border-transparent ${
                errors.email ? "border-red-500" : "border-gray-300"
              }`}
              placeholder="ejemplo@correo.com"
            />
          </div>
          {errors.email && (
            <p className="mt-1 text-sm text-red-600">{errors.email}</p>
          )}
        </div>

        {/* Contraseña */}
        <div>
          <label
            htmlFor="contraseña"
            className="block text-sm font-medium text-gray-700 mb-2"
          >
            Contraseña
          </label>
          <div className="relative">
            <div className="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
              <Lock className="h-5 w-5 text-gray-400" />
            </div>
            <input
              type={showPassword ? "text" : "password"}
              id="contraseña"
              name="contraseña"
              value={formData.contraseña}
              onChange={handleChange}
              className={`w-full pl-10 pr-12 py-3 border rounded-lg focus:outline-none focus:ring-2 focus:ring-cyan-500 focus:border-transparent ${
                errors.contraseña ? "border-red-500" : "border-gray-300"
              }`}
              placeholder="Mínimo 6 caracteres"
            />
            <button
              type="button"
              onClick={() => setShowPassword(!showPassword)}
              className="absolute inset-y-0 right-0 pr-3 flex items-center"
            >
              {showPassword ? (
                <EyeOff className="h-5 w-5 text-gray-400 hover:text-gray-600" />
              ) : (
                <Eye className="h-5 w-5 text-gray-400 hover:text-gray-600" />
              )}
            </button>
          </div>
          {errors.contraseña && (
            <p className="mt-1 text-sm text-red-600">{errors.contraseña}</p>
          )}
        </div>

        {/* Confirmación de Contraseña */}
        <div>
          <label
            htmlFor="confirmacionContraseña"
            className="block text-sm font-medium text-gray-700 mb-2"
          >
            Confirmar Contraseña
          </label>
          <div className="relative">
            <div className="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
              <Lock className="h-5 w-5 text-gray-400" />
            </div>
            <input
              type={showConfirmPassword ? "text" : "password"}
              id="confirmacionContraseña"
              name="confirmacionContraseña"
              value={formData.confirmacionContraseña}
              onChange={handleChange}
              className={`w-full pl-10 pr-12 py-3 border rounded-lg focus:outline-none focus:ring-2 focus:ring-cyan-500 focus:border-transparent ${
                errors.confirmacionContraseña
                  ? "border-red-500"
                  : "border-gray-300"
              }`}
              placeholder="Repite tu contraseña"
            />
            <button
              type="button"
              onClick={() => setShowConfirmPassword(!showConfirmPassword)}
              className="absolute inset-y-0 right-0 pr-3 flex items-center"
            >
              {showConfirmPassword ? (
                <EyeOff className="h-5 w-5 text-gray-400 hover:text-gray-600" />
              ) : (
                <Eye className="h-5 w-5 text-gray-400 hover:text-gray-600" />
              )}
            </button>
          </div>
          {errors.confirmacionContraseña && (
            <p className="mt-1 text-sm text-red-600">
              {errors.confirmacionContraseña}
            </p>
          )}
        </div>

        {/* Botón de Submit */}
        <button
          onClick={handleSubmit}
          className="w-full bg-gradient-to-r from-cyan-500 to-blue-600 text-white py-3 px-4 rounded-lg font-medium hover:from-cyan-600 hover:to-blue-700 focus:outline-none focus:ring-2 focus:ring-cyan-500 focus:ring-offset-2 transition-all duration-200 transform hover:scale-105"
        >
          Crear Cuenta
        </button>

        {/* Link para login */}
        <div className="text-center mt-6">
          <p className="text-sm text-gray-600">
            ¿Ya tienes una cuenta?{" "}
            <Link
              to="/login"
              className="font-medium text-cyan-600 hover:text-cyan-500"
            >
              Inicia sesión
            </Link>
          </p>
        </div>
      </div>
    </div>
  );
};

export default Registro;
