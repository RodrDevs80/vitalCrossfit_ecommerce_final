import { useContext, useState } from "react";
import CartProduct from "./CartProduct.jsx";
import { Box, Pagination, Stack } from "@mui/material";
import { useEffect } from "react";
import getProductos from "../services/getProductos.js";
import { CuponContext } from "../context/cuponContext.jsx";
import FilterBar from "./FilterBar.jsx";

function ContainerCart() {
  const [selectedCard, setSelectedCard] = useState(0);
  const [productos, setProductos] = useState([]);
  const [filtros, setFiltros] = useState({
    category: "",
    searchQuery: "",
    showNew: false,
    showOffers: false,
  });
  const [currentPage, setCurrentPage] = useState(1);
  const productsPerPage = 12;

  const { cuponValido, cupon } = useContext(CuponContext);

  useEffect(() => {
    getProductos()
      .then((res) => setProductos(res))
      .catch((err) => console.log(err));
  }, []);

  // Filtrar productos
  const filteredProducts = productos.filter(
    (producto) =>
      producto.nombre
        .toLowerCase()
        .includes(filtros.searchQuery.toLowerCase()) ||
      producto.descripcion
        .toLowerCase()
        .includes(filtros.searchQuery.toLowerCase())
  );

  // Calcular productos para la página actual
  const indexOfLastProduct = currentPage * productsPerPage;
  const indexOfFirstProduct = indexOfLastProduct - productsPerPage;
  const currentProducts = filteredProducts.slice(
    indexOfFirstProduct,
    indexOfLastProduct
  );

  // Calcular total de páginas
  const totalPages = Math.ceil(filteredProducts.length / productsPerPage);

  // Resetear a página 1 cuando cambian los filtros
  useEffect(() => {
    setCurrentPage(1);
  }, [filtros]);

  const handlePageChange = (event, value) => {
    setCurrentPage(value);
  };

  return (
    <>
      <FilterBar onFilterChange={setFiltros} />

      <Box
        sx={{
          width: "100%",
          display: "grid",
          gridTemplateColumns: {
            xs: "1fr", // 1 columna en mobile
            sm: "repeat(2, 1fr)", // 2 columnas en tablet
            md: "repeat(3, 1fr)", // 3 columnas en desktop
          },
          gridTemplateRows: "1fr",
          placeItems: "center",
          gap: 2,
          margin: "5px",
          mb: 2, // Margen inferior para separar de la paginación
        }}
      >
        {currentProducts.map((producto) => (
          <CartProduct
            key={producto.id}
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
              "&[data-active]": {
                backgroundColor: "action.selected",
                "&:hover": {
                  backgroundColor: "action.selectedHover",
                },
              },
            }}
          ></CartProduct>
        ))}
      </Box>

      {/* Paginación */}
      {filteredProducts.length > productsPerPage && (
        <Stack spacing={2} alignItems="center" sx={{ mt: 2, mb: 2 }}>
          <Pagination
            count={totalPages}
            page={currentPage}
            onChange={handlePageChange}
            color="primary"
            size="large"
            showFirstButton
            showLastButton
          />
        </Stack>
      )}
    </>
  );
}

export default ContainerCart;
