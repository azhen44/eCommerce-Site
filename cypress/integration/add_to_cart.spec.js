describe('Jungle Home Page Tests', () => {
  beforeEach(() => {
        cy.visit('localhost:3000')
  })

  it('displays Welcome to The Jungle', () => {
    cy.get('.hero').contains("Welcome to The Jungle")
  })

  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("There is 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });

  it("Cart should not be 0 after adding an item. My Cart should have an item", () => {
    cy.get("button.btn").first().click()
    cy.get(".end-0").should('not.have.length', 0)
    cy.contains("My Cart").click()
    cy.get("img").should('exist')
  });
})
