context('Add to cart', () => {
  beforeEach(() => {
  })

  it('visits the home page', () => {
    cy.visit('/', { timeout: 500000 });
  })

  it("Clicks the signup button", () => {
    cy.get('.nav-user-link').contains('Signup').click();
  });

  it("Inputs a first name", () => {
    cy.get("#user_first_name").type("James");
  });

  it("Inputs a last name", () => {
    cy.get("#user_last_name").type("Brown");
  });

  it("Inputs an email", () => {
    cy.get("#user_email").type("james@jamesbrown.com");
  });

  it("Inputs a password", () => {
    cy.get("#user_password").type("james");
  });

  it("Confirms that password", () => {
    cy.get("#user_password_confirmation").type("james");
  });

  it("Clicks the submit button", () => {
    cy.get("input[type=submit]").click();
  });

  it("Is redirected to the home page", () => {
    cy.get(".products article").should("have.length", 2);
  });

  it("Logs out of the account", () => {
    cy.get('.nav-user-link').contains('Logout').click();
  });

  it("Clicks the login button", () => {
    cy.contains('Login').click();
  });

  it("Inputs user email", () => {
    cy.get("#email").type("james@jamesbrown.com");
  });

  it("Inputs user password", () => {
    cy.get("#password").type("james");
  });

  it("Clicks the submit button", () => {
    cy.get("input[type=submit]").click();
  });

  it("Confirms that the user is logged in", () => {
    cy.contains('Hi, James')
  });

  

  // it("clicks 'add to cart' on a product", () => {
  //   cy.get(".add-to-cart").first().click({ force: true });
  // });

  // it('verifies that the cart value has increased by 1', () => {
  //   cy.contains("My Cart (1)")
  // })

})