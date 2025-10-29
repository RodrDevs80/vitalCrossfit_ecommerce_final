// import { useContext, useEffect } from "react";
// import { useState } from "react";
// import { Link, useParams } from "react-router-dom";
// import getCategoriaById from "../services/getCategoriaById";
// import { Box, Button, Card, Typography } from "@mui/material";
// import { CuponContext } from "../context/cuponContext";
// import getProductos from "../services/getProductos";
// import CartProduct from "./CartProduct.jsx";

// export const CategoriaDetalles = () => {
//   const [selectedCard, setSelectedCard] = useState(0);
//   const [productos, setProductos] = useState([]);
//   const [cate, setCate] = useState({});
//   const idCategoria = useParams();
//   const { cuponValido, cupon } = useContext(CuponContext);
//   useEffect(() => {
//     getCategoriaById(Number(idCategoria.id))
//       .then((res) => setCate(res))
//       .catch((err) => console.log(err));
//     getProductos()
//       .then((res) => setProductos(res))
//       .catch((err) => console.log(err));
//     // eslint-disable-next-line react-hooks/exhaustive-deps
//   }, []);
//   console.log(cate.nombre);

//   return (
//     <>
//       <Typography>{cate.nombre}</Typography>
//       <Typography>{cate.descripcion}</Typography>
//       <Box
//         sx={{
//           width: "100%",
//           display: "grid",
//           gridTemplateColumns: {
//             xs: "1fr", // 1 columna en mobile
//             sm: "repeat(2, 1fr)", // 2 columnas en tablet
//             md: "repeat(3, 1fr)", // 3 columnas en desktop
//           },
//           gridTemplateRows: "1fr",
//           placeItems: "center",
//           gap: 2,
//           margin: "5px",
//         }}
//       >
//         {productos &&
//           productos
//             .filter((product) => product.idCategoria === Number(idCategoria.id))
//             .map((producto) => (
//               <CartProduct
//                 key={producto.id}
//                 cupon={cupon}
//                 cuponValido={cuponValido}
//                 id={producto.id}
//                 img={producto.imagenUrl}
//                 titulo={producto.nombre}
//                 nombreProducto={producto.nombre}
//                 descripcion={producto.descripcion}
//                 precio={producto.precio}
//                 calificacion={producto.calificacion}
//                 descuento={producto.descuento}
//                 oferta={producto.oferta}
//                 onClick={() => setSelectedCard(producto.id)}
//                 data-active={selectedCard === producto.id ? "" : undefined}
//                 sx={{
//                   height: "100%",
//                   "&[data-active]": {
//                     backgroundColor: "action.selected",
//                     "&:hover": {
//                       backgroundColor: "action.selectedHover",
//                     },
//                   },
//                 }}
//               ></CartProduct>
//             ))}
//       </Box>
//     </>
//   );
// };

import { useContext, useEffect } from "react";
import { useState } from "react";
import { Link, useParams } from "react-router-dom";
import getCategoriaById from "../services/getCategoriaById";
import {
  Box,
  Button,
  Card,
  Typography,
  Container,
  Grid,
  Paper,
} from "@mui/material";
import { CuponContext } from "../context/cuponContext";
import getProductos from "../services/getProductos";
import CartProduct from "./CartProduct.jsx";
import ArrowBackIcon from "@mui/icons-material/ArrowBack";

export const CategoriaDetalles = () => {
  const [selectedCard, setSelectedCard] = useState(0);
  const [_, setProductos] = useState([]);
  const [cate, setCate] = useState({});
  const [productosFiltrados, setProductosFiltrados] = useState([]);
  const idCategoria = useParams();
  const { cuponValido, cupon } = useContext(CuponContext);

  useEffect(() => {
    getCategoriaById(Number(idCategoria.id))
      .then((res) => setCate(res))
      .catch((err) => console.log(err));
    getProductos()
      .then((res) => {
        setProductos(res);
        const filtrados = res.filter(
          (product) => product.idCategoria === Number(idCategoria.id)
        );
        setProductosFiltrados(filtrados);
      })
      .catch((err) => console.log(err));
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  return (
    <Container maxWidth="xl" sx={{ py: 4, minHeight: "80vh" }}>
      {/* Botón de volver */}
      <Button
        component={Link}
        to="/"
        startIcon={<ArrowBackIcon />}
        sx={{
          mb: 3,
          color: "primary.main",
          "&:hover": {
            backgroundColor: "primary.light",
            color: "white",
          },
          transition: "all 0.3s ease",
        }}
      >
        Volver al Inicio
      </Button>

      {/* Header de la categoría */}
      <Paper
        elevation={0}
        sx={{
          p: 4,
          mb: 4,
          textAlign: "center",
          background: "linear-gradient(135deg, #667eea 0%, #764ba2 100%)",
          color: "white",
          borderRadius: 3,
        }}
      >
        <Typography
          variant="h3"
          component="h1"
          sx={{
            fontWeight: "bold",
            mb: 2,
            fontSize: { xs: "2rem", md: "3rem" },
          }}
        >
          {cate.nombre}
        </Typography>
        <Typography
          variant="h6"
          sx={{
            opacity: 0.9,
            maxWidth: "600px",
            margin: "0 auto",
            fontSize: { xs: "1rem", md: "1.25rem" },
          }}
        >
          {cate.descripcion}
        </Typography>
      </Paper>

      {/* Contador de productos */}
      <Typography
        variant="h6"
        color="text.secondary"
        sx={{ mb: 3, textAlign: "center" }}
      >
        {productosFiltrados.length === 0
          ? "No hay productos en esta categoría"
          : productosFiltrados.length === 1
          ? "1 producto encontrado"
          : `${productosFiltrados.length} productos encontrados`}
      </Typography>

      {/* Grid de productos */}
      <Box
        sx={{
          display: "grid",
          gridTemplateColumns: {
            xs: "1fr",
            sm: "repeat(2, 1fr)",
            md: "repeat(3, 1fr)",
            lg:
              productosFiltrados.length >= 4
                ? "repeat(4, 1fr)"
                : productosFiltrados.length === 3
                ? "repeat(3, 1fr)"
                : productosFiltrados.length === 2
                ? "repeat(2, 1fr)"
                : "1fr",
          },
          gap: 3,
          justifyItems: "center",
        }}
      >
        {productosFiltrados.map((producto) => (
          <Box
            key={producto.id}
            sx={{
              width: "100%",
              maxWidth: "350px",
              display: "flex",
              justifyContent: "center",
            }}
          >
            <CartProduct
              cupon={cupon}
              cuponValido={cuponValido}
              id={producto.id}
              img={producto.imagenUrl}
              titulo={producto.nombre}
              nombreProducto={producto.nombre}
              descripcion={producto.descripcion}
              precio={producto.precio}
              calificacion={producto.calificacion}
              descuento={producto.descuento}
              oferta={producto.oferta}
              onClick={() => setSelectedCard(producto.id)}
              data-active={selectedCard === producto.id ? "" : undefined}
              sx={{
                height: "100%",
                width: "100%",
                transition: "all 0.3s ease",
                "&:hover": {
                  transform: "translateY(-4px)",
                  boxShadow: 3,
                },
                "&[data-active]": {
                  backgroundColor: "action.selected",
                  transform: "translateY(-2px)",
                  "&:hover": {
                    backgroundColor: "action.selectedHover",
                    transform: "translateY(-4px)",
                  },
                },
              }}
            />
          </Box>
        ))}
      </Box>

      {/* Mensaje cuando no hay productos */}
      {productosFiltrados.length === 0 && (
        <Paper
          sx={{
            p: 6,
            textAlign: "center",
            mt: 4,
            background: "linear-gradient(45deg, #f5f7fa 0%, #c3cfe2 100%)",
          }}
        >
          <Typography variant="h5" color="text.secondary" gutterBottom>
            No hay productos disponibles
          </Typography>
          <Typography variant="body1" color="text.secondary" sx={{ mb: 3 }}>
            Pronto agregaremos nuevos productos a esta categoría
          </Typography>

          <Button
            component={Link}
            to="/categorias"
            variant="contained"
            size="large"
            startIcon={<ArrowBackIcon />}
            sx={{
              px: 4,
              py: 1.5,
              borderRadius: 2,
              textTransform: "none",
              fontSize: "1.1rem",
            }}
          >
            Explorar otras categorías
          </Button>
        </Paper>
      )}
    </Container>
  );
};
