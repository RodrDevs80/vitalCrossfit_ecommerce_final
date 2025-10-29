import { Router } from "express";
import enviarEmailController from "../controllers/sendMail.controller.js";


const sendEmailRoutes = Router();

sendEmailRoutes.post("/", enviarEmailController);


export default sendEmailRoutes;