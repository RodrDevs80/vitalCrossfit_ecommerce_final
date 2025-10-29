import axios from 'axios';

const sendEmail = async (emailData) => {
    try {
        const response = await axios.post("http://localhost:3000/api/v1/sendEmail", emailData, {
            headers: {
                "Content-Type": "application/json",
            },
        });

        return response.data;
    } catch (error) {
        console.error("Error enviando email:", error);
        throw error;
    }
};

export default sendEmail;