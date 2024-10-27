const db = require("../db/db-config.js");

const getAllOrganizations = async () => {
  try {
    const allOrganizations = await db.any("SELECT * FROM organizations");
    return allOrganizations;
  } catch (error) {
    throw error;
  }
};

const getOrganizationById = async (id) => {
  try {
    const organization = await db.one(
      "SELECT * FROM organizations WHERE id=$1",
      id
    );
    return organization;
  } catch (error) {
    throw error;
  }
};

const createOrganization = async (organization) => {
  const { address_id, phone, name, description } = organization;

  try {
    const newOrganization = await db.one(
      "INSERT INTO organizations (address_id, phone, name, description) VALUES($1, $2, $3, $4) RETURNING *",
      [address_id, phone, name, description]
    );
    return newOrganization;
  } catch (error) {
    throw error;
  }
};

const deleteOrganization = async (id) => {
  try {
    const deletedOrganization = await db.one(
      "DELETE FROM organizations WHERE id = $1 RETURNING *",
      id
    );
    return deletedOrganization;
  } catch (error) {
    throw error;
  }
};

const updateOrganization = async (id, organization) => {
  const { address_id, phone, name, description } = organization;

  try {
    const updatedOrganization = await db.one(
      "UPDATE organizations SET address_id=$1, phone=$2, name=$3, description=$4 WHERE id=$5 RETURNING *",
      [address_id, phone, name, description, id]
    );
    return updatedOrganization;
  } catch (error) {
    throw error;
  }
};

module.exports = {
  getAllOrganizations,
  getOrganizationById,
  createOrganization,
  deleteOrganization,
  updateOrganization,
};
