const getAllRequesters = `
    SELECT * FROM requesters;
`;

const getRequesterById = `
    SELECT * FROM requesters WHERE id = $1;
`;

const createRequester = `
    INSERT INTO requesters (name, email, phone, organization, address) 
    VALUES ($1, $2, $3, $4, $5) RETURNING *;
`;

const updateRequester = `
    UPDATE requesters 
    SET name = $1, email = $2, phone = $3, organization = $4, address = $5
    WHERE id = $6 RETURNING *;
`;

const deleteRequester = `
    DELETE FROM requesters WHERE id = $1;
`;

module.exports = {
  getAllRequesters,
  getRequesterById,
  createRequester,
  updateRequester,
  deleteRequester,
};
